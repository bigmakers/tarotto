import Foundation
import Security

@Observable
final class AISettingsManager {
    static let shared = AISettingsManager()

    private let selectedProviderKey = "tarotto_selected_ai_provider"

    var selectedProvider: AIProvider? {
        get {
            guard let raw = UserDefaults.standard.string(forKey: selectedProviderKey) else { return nil }
            return AIProvider(rawValue: raw)
        }
        set {
            UserDefaults.standard.set(newValue?.rawValue, forKey: selectedProviderKey)
        }
    }

    var hasConfiguredProvider: Bool {
        guard let provider = selectedProvider else { return false }
        return apiKey(for: provider) != nil
    }

    func currentService() -> AIInterpretationService? {
        guard let provider = selectedProvider, apiKey(for: provider) != nil else { return nil }
        switch provider {
        case .openAI: return OpenAIService()
        case .claude: return ClaudeService()
        case .gemini: return GeminiService()
        }
    }

    // MARK: - Keychain Operations

    func apiKey(for provider: AIProvider) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "com.tarotto.apikey",
            kSecAttrAccount as String: provider.rawValue,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess,
              let data = result as? Data,
              let key = String(data: data, encoding: .utf8) else {
            return nil
        }
        return key.isEmpty ? nil : key
    }

    func setAPIKey(_ key: String?, for provider: AIProvider) {
        // Delete existing
        let deleteQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "com.tarotto.apikey",
            kSecAttrAccount as String: provider.rawValue
        ]
        SecItemDelete(deleteQuery as CFDictionary)

        // Add new if provided
        guard let key, !key.isEmpty else { return }

        let addQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "com.tarotto.apikey",
            kSecAttrAccount as String: provider.rawValue,
            kSecValueData as String: key.data(using: .utf8)!,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlockedThisDeviceOnly
        ]
        SecItemAdd(addQuery as CFDictionary, nil)
    }

    func removeAPIKey(for provider: AIProvider) {
        setAPIKey(nil, for: provider)
        if selectedProvider == provider {
            selectedProvider = nil
        }
    }
}
