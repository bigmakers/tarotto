import Foundation

final class OpenAIService: AIInterpretationService {
    let provider: AIProvider = .openAI

    func generateReading(
        cards: [DrawnCard],
        question: String,
        targetPerson: String
    ) async throws -> AsyncThrowingStream<String, Error> {
        guard let apiKey = AISettingsManager.shared.apiKey(for: .openAI) else {
            throw AIServiceError.noAPIKey
        }

        let prompt = AIPromptBuilder.buildPrompt(cards: cards, question: question, targetPerson: targetPerson)

        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "model": "gpt-4o",
            "stream": true,
            "messages": [
                ["role": "system", "content": AIPromptBuilder.systemPrompt],
                ["role": "user", "content": prompt]
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

            if httpResponse.statusCode == 401 {
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
                            if data == "[DONE]" {
                                continuation.finish()
                                return
                            }
                            if let jsonData = data.data(using: .utf8),
                               let json = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
                               let choices = json["choices"] as? [[String: Any]],
                               let delta = choices.first?["delta"] as? [String: Any],
                               let content = delta["content"] as? String {
                                continuation.yield(content)
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
