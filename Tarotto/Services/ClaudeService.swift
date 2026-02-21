import Foundation

final class ClaudeService: AIInterpretationService {
    let provider: AIProvider = .claude

    func generateReading(
        cards: [DrawnCard],
        question: String,
        targetPerson: String
    ) async throws -> AsyncThrowingStream<String, Error> {
        guard let apiKey = AISettingsManager.shared.apiKey(for: .claude) else {
            throw AIServiceError.noAPIKey
        }

        let prompt = AIPromptBuilder.buildPrompt(cards: cards, question: question, targetPerson: targetPerson)

        let url = URL(string: "https://api.anthropic.com/v1/messages")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.setValue("2023-06-01", forHTTPHeaderField: "anthropic-version")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "model": "claude-sonnet-4-20250514",
            "max_tokens": 4096,
            "stream": true,
            "system": AIPromptBuilder.systemPrompt,
            "messages": [
                ["role": "user", "content": prompt]
            ]
        ]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (asyncBytes, response) = try await URLSession.shared.bytes(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw AIServiceError.invalidResponse
        }

        // Handle error responses by reading the body for details
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
            // Extract error message from JSON if possible
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
                               let json = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] {
                                let eventType = json["type"] as? String
                                if eventType == "content_block_delta",
                                   let delta = json["delta"] as? [String: Any],
                                   let text = delta["text"] as? String {
                                    continuation.yield(text)
                                } else if eventType == "message_stop" {
                                    continuation.finish()
                                    return
                                } else if eventType == "error",
                                          let error = json["error"] as? [String: Any],
                                          let message = error["message"] as? String {
                                    continuation.finish(throwing: AIServiceError.serverError(
                                        statusCode: 0, message: message
                                    ))
                                    return
                                }
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
