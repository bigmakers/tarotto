import SwiftUI
import SwiftData

@main
struct TarottoApp: App {
    @State private var settings = AppSettings.shared
    @State private var premiumManager = PremiumManager.shared

    init() {
        PremiumManager.shared.startTransactionListener()
    }

    var body: some Scene {
        WindowGroup {
            if settings.isOnboardingComplete {
                HomeView()
                    .preferredColorScheme(.dark)
                    .task {
                        await premiumManager.loadProducts()
                        await premiumManager.checkEntitlements()
                    }
            } else {
                OnboardingView()
                    .preferredColorScheme(.dark)
            }
        }
        .modelContainer(for: [Reading.self, DrawnCard.self])
    }
}
