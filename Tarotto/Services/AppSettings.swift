import Foundation

@Observable
final class AppSettings {
    static let shared = AppSettings()

    enum AppLanguage: String, CaseIterable, Identifiable {
        case japanese = "ja"
        case english = "en"

        var id: String { rawValue }

        var displayName: String {
            switch self {
            case .japanese: return "日本語"
            case .english: return "English"
            }
        }

        var flag: String {
            switch self {
            case .japanese: return "🇯🇵"
            case .english: return "🇺🇸"
            }
        }
    }

    // MARK: - UserDefaults Keys

    private let languageKey = "tarotto_language"
    private let userNameKey = "tarotto_user_name"
    private let onboardingCompleteKey = "tarotto_onboarding_complete"

    // MARK: - Backing stores (tracked by @Observable)

    private var _language: AppLanguage
    private var _userName: String
    private var _isOnboardingComplete: Bool

    // MARK: - Init

    private init() {
        let raw = UserDefaults.standard.string(forKey: "tarotto_language") ?? "ja"
        _language = AppLanguage(rawValue: raw) ?? .japanese
        _userName = UserDefaults.standard.string(forKey: "tarotto_user_name") ?? ""
        _isOnboardingComplete = UserDefaults.standard.bool(forKey: "tarotto_onboarding_complete")
    }

    // MARK: - Properties

    var language: AppLanguage {
        get { _language }
        set {
            _language = newValue
            UserDefaults.standard.set(newValue.rawValue, forKey: languageKey)
        }
    }

    var userName: String {
        get { _userName }
        set {
            _userName = newValue
            UserDefaults.standard.set(newValue, forKey: userNameKey)
        }
    }

    var isOnboardingComplete: Bool {
        get { _isOnboardingComplete }
        set {
            _isOnboardingComplete = newValue
            UserDefaults.standard.set(newValue, forKey: onboardingCompleteKey)
        }
    }

    var isJapanese: Bool {
        language == .japanese
    }
}
