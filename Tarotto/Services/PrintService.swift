import UIKit

enum PrintService {

    // MARK: - Print a reading result

    static func printReading(
        question: String,
        targetPerson: String,
        drawnCards: [DrawnCard],
        aiReading: String? = nil,
        date: Date = Date()
    ) {
        let html = buildHTML(
            question: question,
            targetPerson: targetPerson,
            drawnCards: drawnCards,
            aiReading: aiReading,
            date: date
        )

        let formatter = UIMarkupTextPrintFormatter(markupText: html)
        let printController = UIPrintInteractionController.shared

        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.jobName = "Tarotto - \(question)"
        printInfo.outputType = .general

        printController.printInfo = printInfo
        printController.printFormatter = formatter

        printController.present(animated: true)
    }

    // MARK: - HTML Generation

    private static func buildHTML(
        question: String,
        targetPerson: String,
        drawnCards: [DrawnCard],
        aiReading: String?,
        date: Date
    ) -> String {
        let sortedCards = drawnCards.sorted { $0.positionRawValue < $1.positionRawValue }
        let langCode = AppSettings.shared.isJapanese ? "ja" : "en"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = AppSettings.shared.isJapanese
            ? Locale(identifier: "ja_JP")
            : Locale(identifier: "en_US")
        dateFormatter.dateFormat = AppSettings.shared.isJapanese
            ? "yyyy年M月d日 HH:mm"
            : "MMM d, yyyy HH:mm"
        let dateString = dateFormatter.string(from: date)

        var cardsHTML = ""
        for card in sortedCards {
            let position = card.position
            let orientationClass = card.orientation == .upright ? "upright" : "reversed"
            let orientationMark = card.orientation == .upright ? "▲" : "▼"

            // Get interpretation
            let interpretation = CardInterpretations.all[card.card]
            let meaning = card.orientation == .upright ? interpretation?.upright : interpretation?.reversed
            let keywords = meaning?.keywords.joined(separator: "・") ?? ""
            let feelingsContext = meaning?.feelingsContext ?? ""

            cardsHTML += """
            <div class="card">
                <div class="card-header">
                    <span class="position-number">\(position.displayNumber)</span>
                    <span class="position-name">\(position.localizedName)</span>
                    <span class="star-name">\(position.starName)</span>
                </div>
                <div class="card-body">
                    <div class="card-name">
                        \(card.card.localizedName)
                        <span class="\(orientationClass)">\(orientationMark) \(card.orientation.localizedName)</span>
                    </div>
                    <div class="keywords">\(keywords)</div>
                    <div class="feeling">\(feelingsContext)</div>
                </div>
            </div>
            """
        }

        var aiSection = ""
        if let aiReading, !aiReading.isEmpty {
            let escapedReading = aiReading
                .replacingOccurrences(of: "&", with: "&amp;")
                .replacingOccurrences(of: "<", with: "&lt;")
                .replacingOccurrences(of: ">", with: "&gt;")
                .replacingOccurrences(of: "\n", with: "<br>")

            aiSection = """
            <div class="ai-section">
                <h2>\(L.aiReading)</h2>
                <div class="ai-text">\(escapedReading)</div>
            </div>
            """
        }

        return """
        <!DOCTYPE html>
        <html lang="\(langCode)">
        <head>
        <meta charset="utf-8">
        <style>
            body {
                font-family: -apple-system, 'Hiragino Sans', sans-serif;
                color: #1a1a2e;
                max-width: 680px;
                margin: 0 auto;
                padding: 20px;
                font-size: 11pt;
                line-height: 1.6;
            }
            .header {
                text-align: center;
                border-bottom: 2px solid #7b5ea7;
                padding-bottom: 16px;
                margin-bottom: 20px;
            }
            .header h1 {
                font-size: 20pt;
                color: #1a1a2e;
                margin: 0 0 4px 0;
                letter-spacing: 2px;
            }
            .header .subtitle {
                font-size: 11pt;
                color: #7b5ea7;
                margin: 0;
            }
            .meta {
                display: flex;
                justify-content: space-between;
                margin-bottom: 16px;
                font-size: 10pt;
                color: #555;
            }
            .meta .question {
                font-weight: bold;
                color: #1a1a2e;
                font-size: 12pt;
            }
            .card {
                border: 1px solid #ddd;
                border-radius: 8px;
                margin-bottom: 10px;
                overflow: hidden;
                page-break-inside: avoid;
            }
            .card-header {
                background: #f0edf5;
                padding: 6px 12px;
                display: flex;
                align-items: center;
                gap: 8px;
            }
            .position-number {
                font-weight: bold;
                font-size: 14pt;
                color: #7b5ea7;
                min-width: 20px;
            }
            .position-name {
                font-weight: bold;
                font-size: 10pt;
            }
            .star-name {
                font-size: 9pt;
                color: #999;
                margin-left: auto;
            }
            .card-body {
                padding: 8px 12px;
            }
            .card-name {
                font-size: 12pt;
                font-weight: bold;
                margin-bottom: 4px;
            }
            .upright { color: #7b5ea7; font-size: 9pt; }
            .reversed { color: #c45050; font-size: 9pt; }
            .keywords {
                font-size: 9pt;
                color: #7b5ea7;
                margin-bottom: 4px;
            }
            .feeling {
                font-size: 10pt;
                color: #333;
                line-height: 1.5;
            }
            .ai-section {
                margin-top: 24px;
                border-top: 2px solid #7b5ea7;
                padding-top: 16px;
                page-break-before: auto;
            }
            .ai-section h2 {
                font-size: 14pt;
                color: #7b5ea7;
                margin: 0 0 12px 0;
            }
            .ai-text {
                font-size: 10.5pt;
                line-height: 1.7;
                color: #222;
            }
            .footer {
                margin-top: 24px;
                text-align: center;
                font-size: 8pt;
                color: #aaa;
                border-top: 1px solid #eee;
                padding-top: 8px;
            }
        </style>
        </head>
        <body>
            <div class="header">
                <h1>Tarotto</h1>
                <p class="subtitle">\(L.appSubtitle)</p>
            </div>

            <div class="meta">
                <div>
                    <div class="question">\(escapeHTML(question))</div>
                    <div>\(L.targetLabel): \(escapeHTML(targetPerson))</div>
                </div>
                <div>\(dateString)</div>
            </div>

            \(cardsHTML)

            \(aiSection)

            <div class="footer">Tarotto — \(L.printFooter)</div>
        </body>
        </html>
        """
    }

    private static func escapeHTML(_ string: String) -> String {
        string
            .replacingOccurrences(of: "&", with: "&amp;")
            .replacingOccurrences(of: "<", with: "&lt;")
            .replacingOccurrences(of: ">", with: "&gt;")
    }
}
