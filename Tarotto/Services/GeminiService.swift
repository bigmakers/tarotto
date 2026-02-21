import Foundation

final class GeminiService: AIInterpretationService {
    let provider: AIProvider = .gemini

    func generateReading(
        cards: [DrawnCard],
        question: String,
        targetPerson: String
    ) async throws -> AsyncThrowingStream<String, Error> {
        guard let apiKey = AISettingsManager.shared.apiKey(for: .gemini) else {
            throw AIServiceError.noAPIKey
        }

        let prompt = AIPromptBuilder.buildPrompt(cards: cards, question: question, targetPerson: targetPerson)
        let systemPrompt = AIPromptBuilder.systemPrompt

        let url = URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:streamGenerateContent?alt=sse&key=\(apiKey)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "system_instruction": [
                "parts": [["text": systemPrompt]]
            ],
            "contents": [
                [
                    "parts": [["text": prompt]]
                ]
            ]
        ]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (asyncBytes, response) = try await URLSession.shared.bytes(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw AIServiceError.invalidResponse
        }

        if httpResponse.statusCode != 200 {
            var errorBody = ""
            for try await line in asyncBytes.lines {
                errorBody += line
            }

            if httpResponse.statusCode == 401 || httpResponse.statusCode == 403 {
                throw AIServiceError.invalidAPIKey
            }
            if httpResponse.statusCode == 429 {
                throw AIServiceError.rateLimited
            }
            let errorMessage: String
            if let jsonData = errorBody.data(using: .utf8),
               let json = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
               let error = json["error"] as? [String: Any],
               let message = error["message"] as? String {
                errorMessage = message
            } else {
                errorMessage = errorBody.isEmpty ? L.unknownError : errorBody
            }
            throw AIServiceError.serverError(statusCode: httpResponse.statusCode, message: errorMessage)
        }

        return AsyncThrowingStream { continuation in
            Task {
                do {
                    for try await line in asyncBytes.lines {
                        if line.hasPrefix("data: ") {
                            let data = String(line.dropFirst(6))
                            if let jsonData = data.data(using: .utf8),
                               let json = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
                               let candidates = json["candidates"] as? [[String: Any]],
                               let content = candidates.first?["content"] as? [String: Any],
                               let parts = content["parts"] as? [[String: Any]],
                               let text = parts.first?["text"] as? String {
                                continuation.yield(text)
                            }
                        }
                    }
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }
        }
    }
}
