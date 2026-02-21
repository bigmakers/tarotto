import Foundation

enum AIProvider: String, CaseIterable, Identifiable, Codable {
    case openAI = "OpenAI"
    case claude = "Claude"
    case gemini = "Gemini"

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .openAI: return "ChatGPT (OpenAI)"
        case .claude: return "Claude (Anthropic)"
        case .gemini: return "Gemini (Google)"
        }
    }

    var iconName: String {
        switch self {
        case .openAI: return "brain"
        case .claude: return "brain.head.profile"
        case .gemini: return "sparkle"
        }
    }
}

protocol AIInterpretationService {
    var provider: AIProvider { get }
    func generateReading(
        cards: [DrawnCard],
        question: String,
        targetPerson: String
    ) async throws -> AsyncThrowingStream<String, Error>
}

enum AIServiceError: LocalizedError {
    case noAPIKey
    case invalidResponse
    case networkError(Error)
    case rateLimited
    case invalidAPIKey
    case serverError(statusCode: Int, message: String)

    var errorDescription: String? {
        switch self {
        case .noAPIKey: return L.noAPIKeyError
        case .invalidResponse: return L.invalidResponseError
        case .networkError(let error): return L.networkError(error.localizedDescription)
        case .rateLimited: return L.rateLimitedError
        case .invalidAPIKey: return L.invalidAPIKeyError
        case .serverError(let code, let message): return L.serverError(code, message)
        }
    }
}

enum AIPromptBuilder {
    static func buildPrompt(cards: [DrawnCard], question: String, targetPerson: String) -> String {
        L.aiBuildPrompt(cards: cards, question: question, targetPerson: targetPerson)
    }

    static var systemPrompt: String {
        L.aiSystemPrompt
    }
}
