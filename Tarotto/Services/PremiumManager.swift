import Foundation
import StoreKit

@Observable
final class PremiumManager {
    static let shared = PremiumManager()

    // MARK: - Constants

    static let productID = "com.tarotto.app.premium"
    private let isPremiumCacheKey = "tarotto_is_premium"

    // MARK: - State

    enum PurchaseState {
        case idle
        case purchasing
        case purchased
        case failed(String)
    }

    private var _isPremium: Bool

    var isPremium: Bool {
        get { _isPremium }
        set {
            _isPremium = newValue
            UserDefaults.standard.set(newValue, forKey: isPremiumCacheKey)
        }
    }

    var product: Product?
    var purchaseState: PurchaseState = .idle

    private var transactionListener: Task<Void, Error>?

    // MARK: - Init

    private init() {
        _isPremium = UserDefaults.standard.bool(forKey: "tarotto_is_premium")
    }

    // MARK: - Start Listening (call on app launch)

    func startTransactionListener() {
        transactionListener = Task.detached {
            for await result in Transaction.updates {
                await self.handleTransactionResult(result)
            }
        }
    }

    // MARK: - Load Products

    func loadProducts() async {
        do {
            let products = try await Product.products(for: [Self.productID])
            await MainActor.run {
                self.product = products.first
            }
        } catch {
            // Products failed to load — the app still works, just can't purchase
        }
    }

    // MARK: - Purchase

    func purchase() async {
        guard let product else { return }
        await MainActor.run {
            purchaseState = .purchasing
        }

        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                let transaction = try checkVerified(verification)
                await transaction.finish()
                await MainActor.run {
                    self.isPremium = true
                    self.purchaseState = .purchased
                }
            case .userCancelled:
                await MainActor.run {
                    self.purchaseState = .idle
                }
            case .pending:
                await MainActor.run {
                    self.purchaseState = .idle
                }
            @unknown default:
                await MainActor.run {
                    self.purchaseState = .idle
                }
            }
        } catch {
            await MainActor.run {
                self.purchaseState = .failed(error.localizedDescription)
            }
        }
    }

    // MARK: - Restore Purchases

    func restorePurchases() async {
        try? await AppStore.sync()
        await checkEntitlements()
    }

    // MARK: - Check Entitlements (call on app launch)

    func checkEntitlements() async {
        for await result in Transaction.currentEntitlements {
            if case .verified(let transaction) = result {
                if transaction.productID == Self.productID {
                    await MainActor.run {
                        self.isPremium = true
                    }
                    return
                }
            }
        }
    }

    // MARK: - Helpers

    private func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified:
            throw StoreKitError.notAvailableInStorefront
        case .verified(let value):
            return value
        }
    }

    private func handleTransactionResult(_ result: VerificationResult<Transaction>) async {
        guard case .verified(let transaction) = result else { return }
        if transaction.productID == Self.productID {
            if transaction.revocationDate == nil {
                await MainActor.run { self.isPremium = true }
            } else {
                await MainActor.run { self.isPremium = false }
            }
            await transaction.finish()
        }
    }

    deinit {
        transactionListener?.cancel()
    }
}
