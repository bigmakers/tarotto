import Foundation

// MARK: - Localization Helper
// All UI strings are centralized here with Japanese/English support.

enum L {
    private static var ja: Bool { AppSettings.shared.isJapanese }

    // MARK: - Home

    static var appSubtitle: String {
        ja ? "北斗七星スプレッド" : "Big Dipper Spread"
    }
    static var homeDescription: String {
        ja ? "特定の人物の気持ちを\n北斗七星の導きで読み解く"
            : "Read someone's feelings\nguided by the Big Dipper"
    }
    static var startReading: String {
        ja ? "占いを始める" : "Start Reading"
    }
    static var pastReadings: String {
        ja ? "過去のリーディング" : "Past Readings"
    }
    static var settings: String {
        ja ? "設定" : "Settings"
    }

    // MARK: - Reading Session

    static var bigDipperSpread: String {
        ja ? "北斗七星スプレッド" : "Big Dipper Spread"
    }
    static var targetPersonLabel: String {
        ja ? "気持ちを知りたい人" : "Person to Read"
    }
    static var targetPersonPlaceholder: String {
        ja ? "例：あの人" : "e.g. That person"
    }
    static var questionLabel: String {
        ja ? "質問" : "Question"
    }
    static var questionPlaceholder: String {
        ja ? "例：あの人は私のことをどう思っている？"
            : "e.g. What does that person think of me?"
    }
    static var drawCards: String {
        ja ? "カードを引く" : "Draw Cards"
    }
    static var guidanceBeforeDraw: String {
        ja ? "心を落ち着けて、相手のことを\n思い浮かべながらタップしてください"
            : "Calm your mind, think of the person,\nand tap to begin"
    }
    static var tapToReveal: String {
        ja ? "カードをタップしてめくってください" : "Tap a card to reveal it"
    }
    static var allCardsRevealed: String {
        ja ? "全てのカードが開かれました" : "All cards have been revealed"
    }
    static var aiGuidanceText: String {
        ja ? "全てのカードをめくると、AIによる総合診断が受けられます"
            : "Reveal all cards to unlock AI comprehensive reading"
    }
    static var viewAIReading: String {
        ja ? "AIリーディングを見る" : "View AI Reading"
    }
    static var tapCardForDetail: String {
        ja ? "カードをタップして詳細を見る" : "Tap a card for details"
    }
    static var save: String {
        ja ? "保存" : "Save"
    }
    static var saved: String {
        ja ? "保存しました" : "Saved"
    }
    static var back: String {
        ja ? "戻る" : "Back"
    }
    static var ok: String { "OK" }

    // MARK: - Shuffle / Drawing Animation

    static var calmYourMind: String {
        ja ? "心を落ち着けて..." : "Calm your mind..."
    }
    static var spreadingCards: String {
        ja ? "カードを広げています..." : "Spreading cards..."
    }
    static var shuffling: String {
        ja ? "シャッフル中..." : "Shuffling..."
    }
    static var drawingCardsPrompt: String {
        ja ? "カードを引きます..." : "Drawing cards..."
    }
    static var drawingEvery7th: String {
        ja ? "7枚目のカードを引いています" : "Drawing every 7th card"
    }
    static func drawnCardsCount(_ count: Int) -> String {
        ja ? "引いたカード: \(count) / 7" : "Cards drawn: \(count) / 7"
    }

    // MARK: - Card Detail

    static func starLabel(_ number: Int, _ name: String) -> String {
        ja ? "第\(number)の星" : "Star #\(number)"
    }
    static var feelingsInterpretation: String {
        ja ? "気持ちの解釈" : "Feelings Interpretation"
    }
    static var generalMeaning: String {
        ja ? "一般的な意味" : "General Meaning"
    }
    static var close: String {
        ja ? "閉じる" : "Close"
    }

    // MARK: - AI Reading

    static var aiReading: String {
        ja ? "AIリーディング" : "AI Reading"
    }
    static var retry: String {
        ja ? "再試行" : "Retry"
    }
    static var readingInProgress: String {
        ja ? "リーディング中..." : "Reading..."
    }
    static var aiNotConfigured: String {
        ja ? "AIプロバイダーが設定されていません。設定画面でAPIキーを入力してください。"
            : "AI provider is not configured. Please enter an API key in Settings."
    }

    // MARK: - Settings

    static var settingsTitle: String {
        ja ? "設定" : "Settings"
    }
    static var aiProvider: String {
        ja ? "AIプロバイダー" : "AI Provider"
    }
    static var dontUseAI: String {
        ja ? "AIを使用しない" : "Don't use AI"
    }
    static var notConfigured: String {
        ja ? "未設定" : "Not set"
    }
    static var aiProviderFooter: String {
        ja ? "AIを有効にすると、全カードめくり後に総合リーディングを生成できます。"
            : "Enable AI to generate a comprehensive reading after all cards are revealed."
    }
    static var apiKeys: String {
        ja ? "APIキー" : "API Keys"
    }
    static var apiKeySaveNote: String {
        ja ? "APIキーはこの端末のKeychain内に安全に保存されます。外部に送信されることはありません（各AIプロバイダーへのリクエスト時を除く）。"
            : "API keys are securely stored in this device's Keychain. They are never transmitted externally (except when making requests to each AI provider)."
    }
    static var aboutApp: String {
        ja ? "このアプリについて" : "About This App"
    }
    static var appNameLabel: String {
        ja ? "アプリ名" : "App Name"
    }
    static var spreadLabel: String {
        ja ? "スプレッド" : "Spread"
    }
    static var deckLabel: String {
        ja ? "デッキ" : "Deck"
    }
    static var fullDeck78: String {
        ja ? "78枚フルデッキ" : "Full 78-Card Deck"
    }
    static var saveBtn: String {
        ja ? "保存" : "Save"
    }
    static var deleteBtn: String {
        ja ? "削除" : "Delete"
    }
    static var languageSection: String {
        ja ? "言語" : "Language"
    }
    static var userNameSection: String {
        ja ? "ユーザー名" : "User Name"
    }
    static var userNamePlaceholder: String {
        ja ? "名前を入力" : "Enter your name"
    }

    // MARK: - History

    static var readingHistory: String {
        ja ? "リーディング履歴" : "Reading History"
    }
    static var noReadingsYet: String {
        ja ? "まだリーディングがありません" : "No readings yet"
    }
    static var readingsWillAppear: String {
        ja ? "占いを行うと、ここに履歴が表示されます。" : "Your readings will appear here."
    }
    static var readingDetail: String {
        ja ? "リーディング詳細" : "Reading Details"
    }

    // MARK: - Error Messages

    static var noAPIKeyError: String {
        ja ? "APIキーが設定されていません" : "API key is not configured"
    }
    static var invalidResponseError: String {
        ja ? "AIからの応答が不正です" : "Invalid response from AI"
    }
    static var rateLimitedError: String {
        ja ? "リクエスト制限に達しました。しばらくお待ちください。"
            : "Rate limit reached. Please wait a moment."
    }
    static var invalidAPIKeyError: String {
        ja ? "APIキーが無効です" : "Invalid API key"
    }
    static func serverError(_ code: Int, _ msg: String) -> String {
        ja ? "サーバーエラー (\(code)): \(msg)" : "Server error (\(code)): \(msg)"
    }
    static func networkError(_ desc: String) -> String {
        ja ? "ネットワークエラー: \(desc)" : "Network error: \(desc)"
    }
    static var unknownError: String {
        ja ? "不明なエラー" : "Unknown error"
    }

    // MARK: - Onboarding

    static var welcomeTitle: String {
        ja ? "ようこそ" : "Welcome"
    }
    static var welcomeSubtitle: String {
        ja ? "北斗七星の導きで\n気持ちを読み解きましょう"
            : "Let the Big Dipper guide you\nto read someone's heart"
    }
    static var enterYourName: String {
        ja ? "あなたの名前" : "Your Name"
    }
    static var namePlaceholder: String {
        ja ? "名前を入力（任意）" : "Enter your name (optional)"
    }
    static var chooseLanguage: String {
        ja ? "言語を選択" : "Choose Language"
    }
    static var getStarted: String {
        ja ? "はじめる" : "Get Started"
    }

    // MARK: - Print

    static var targetLabel: String {
        ja ? "対象者" : "Target Person"
    }
    static var printFooter: String {
        ja ? "北斗七星タロットリーディング" : "Big Dipper Tarot Reading"
    }

    // MARK: - SpreadPosition

    static func positionName(_ pos: SpreadPosition) -> String {
        if ja {
            switch pos {
            case .currentSituation: return "現在の状況"
            case .causeObstacle: return "原因・妨害"
            case .pastFeelings: return "過去の気持ち"
            case .currentFeelings: return "現在の気持ち"
            case .subconscious: return "潜在意識"
            case .howTheyRelate: return "あなたへの関わり方"
            case .futureFeelings: return "今後の気持ち・結論"
            }
        } else {
            switch pos {
            case .currentSituation: return "Current Situation"
            case .causeObstacle: return "Cause / Obstacle"
            case .pastFeelings: return "Past Feelings"
            case .currentFeelings: return "Current Feelings"
            case .subconscious: return "Subconscious"
            case .howTheyRelate: return "How They Relate"
            case .futureFeelings: return "Future / Conclusion"
            }
        }
    }

    /// Compact position name with line breaks for the spread layout
    static func positionNameCompact(_ pos: SpreadPosition) -> String {
        if ja {
            switch pos {
            case .currentSituation: return "現在の\n状況"
            case .causeObstacle: return "原因\n妨害"
            case .pastFeelings: return "過去の\n気持ち"
            case .currentFeelings: return "現在の\n気持ち"
            case .subconscious: return "潜在\n意識"
            case .howTheyRelate: return "あなたへの\n関わり方"
            case .futureFeelings: return "今後の\n気持ち・結論"
            }
        } else {
            switch pos {
            case .currentSituation: return "Current\nSituation"
            case .causeObstacle: return "Cause /\nObstacle"
            case .pastFeelings: return "Past\nFeelings"
            case .currentFeelings: return "Current\nFeelings"
            case .subconscious: return "Sub-\nconscious"
            case .howTheyRelate: return "How They\nRelate"
            case .futureFeelings: return "Future /\nConclusion"
            }
        }
    }

    static func positionDescription(_ pos: SpreadPosition) -> String {
        if ja {
            switch pos {
            case .currentSituation:
                return "その人が今どのような状況に立っているか。周囲の環境や一番の関心事などが示されます。"
            case .causeObstacle:
                return "その人が今現在どのような問題を抱えているか。あなたと相手の間にどのような妨害があるかなどが示されます。"
            case .pastFeelings:
                return "過去、あなたに対してどのような気持ちを抱いていたかが示されます。"
            case .currentFeelings:
                return "現在、あなたに対してどのような気持ちを抱いているかが示されます。"
            case .subconscious:
                return "その人が心の底であなたをどう捉えているかが示されます。本人も無自覚な場合があります。"
            case .howTheyRelate:
                return "その人が今後あなたに対してどう関わっていこうとしているかが示されます。"
            case .futureFeelings:
                return "その人が今後あなたに対してどのような気持ちを抱く兆しがあるかが示されます。タロットからの結論、アドバイスです。"
            }
        } else {
            switch pos {
            case .currentSituation:
                return "Shows the person's current situation, their environment, and primary concerns."
            case .causeObstacle:
                return "Reveals the problems they face and any obstacles between you."
            case .pastFeelings:
                return "Shows how they felt about you in the past."
            case .currentFeelings:
                return "Shows how they feel about you right now."
            case .subconscious:
                return "Reveals their deep, subconscious perception of you — they may not even be aware of it."
            case .howTheyRelate:
                return "Shows how they intend to interact with you going forward."
            case .futureFeelings:
                return "Reveals signs of how they will feel about you in the future. This is the tarot's conclusion and advice."
            }
        }
    }

    static func starName(_ pos: SpreadPosition) -> String {
        // Star names are the same in both languages (Chinese astronomical names)
        switch pos {
        case .currentSituation: return "天樞"
        case .causeObstacle: return "天璇"
        case .pastFeelings: return "天璣"
        case .currentFeelings: return "天權"
        case .subconscious: return "玉衡"
        case .howTheyRelate: return "開陽"
        case .futureFeelings: return "搖光"
        }
    }

    // MARK: - CardOrientation

    static func orientationName(_ o: CardOrientation) -> String {
        if ja {
            switch o {
            case .upright: return "正位置"
            case .reversed: return "逆位置"
            }
        } else {
            switch o {
            case .upright: return "Upright"
            case .reversed: return "Reversed"
            }
        }
    }

    // MARK: - TarotCard (English names for cards)

    static func cardName(_ card: TarotCard) -> String {
        if ja {
            return card.japaneseName
        }
        return card.englishName
    }

    // MARK: - CardSuit

    static func suitName(_ suit: CardSuit) -> String {
        if ja {
            return suit.japaneseName
        }
        switch suit {
        case .wands: return "Wands"
        case .cups: return "Cups"
        case .swords: return "Swords"
        case .pentacles: return "Pentacles"
        }
    }

    static func suitElement(_ suit: CardSuit) -> String {
        if ja {
            return suit.element
        }
        switch suit {
        case .wands: return "Fire"
        case .cups: return "Water"
        case .swords: return "Air"
        case .pentacles: return "Earth"
        }
    }

    // MARK: - AI Prompt

    static var aiSystemPrompt: String {
        ja ? "あなたはプロのタロット占い師です。温かく、丁寧で、洞察に満ちたリーディングを提供します。"
            : "You are a professional tarot reader. Provide warm, insightful, and thoughtful readings."
    }

    static func aiBuildPrompt(cards: [DrawnCard], question: String, targetPerson: String) -> String {
        let sortedCards = cards.sorted { $0.positionRawValue < $1.positionRawValue }

        if ja {
            var cardDescriptions = ""
            for card in sortedCards {
                let posName = L.positionName(card.position)
                let cardName = card.card.japaneseName
                let orientation = L.orientationName(card.orientation)
                cardDescriptions += "\(card.position.displayNumber). \(posName): \(cardName)（\(orientation)）\n"
            }

            return """
            あなたはプロのタロット占い師です。北斗七星スプレッド（7枚展開）の結果を読み解いてください。
            このスプレッドは特定の人物の気持ちを占うものです。

            【質問】\(question)
            【対象者】\(targetPerson)

            【展開されたカード】
            \(cardDescriptions)
            【各ポジションの意味】
            1. 現在の状況: その人が今どのような状況に立っているか
            2. 原因・妨害: その人が抱えている問題や、二人の間の妨害
            3. 過去の気持ち: 過去、質問者に対して抱いていた気持ち
            4. 現在の気持ち: 現在、質問者に対して抱いている気持ち
            5. 潜在意識: 心の底で質問者をどう捉えているか（本人も無自覚な場合あり）
            6. あなたへの関わり方: 今後質問者に対してどう関わっていこうとしているか
            7. 今後の気持ち・結論: 今後質問者に対してどのような気持ちを抱く兆しがあるか

            【リーディングの指針】
            - 1枚のカードにとらわれず、7枚全体を見て解釈してください
            - 2枚目の「原因・妨害」、5枚目の「潜在意識」、6枚目の「関わり方」は複合的に捉えてください
            - 相手の気持ちは相手のものであり、思い通りにできないという前提で助言してください
            - 温かみのある丁寧な日本語でリーディングしてください
            - 最後に、今後の行動指針を具体的に示してください
            """
        } else {
            var cardDescriptions = ""
            for card in sortedCards {
                let posName = L.positionName(card.position)
                let cardName = card.card.englishName
                let orientation = L.orientationName(card.orientation)
                cardDescriptions += "\(card.position.displayNumber). \(posName): \(cardName) (\(orientation))\n"
            }

            return """
            You are a professional tarot reader. Please interpret this Big Dipper Spread (7-card spread).
            This spread is designed to read a specific person's feelings.

            [Question] \(question)
            [Target Person] \(targetPerson)

            [Cards Drawn]
            \(cardDescriptions)
            [Position Meanings]
            1. Current Situation: What situation the person is currently in
            2. Cause / Obstacle: Problems they face, obstacles between you two
            3. Past Feelings: How they felt about the querent in the past
            4. Current Feelings: How they feel about the querent now
            5. Subconscious: Their deep perception of the querent (may be unaware of it)
            6. How They Relate: How they intend to interact with the querent going forward
            7. Future / Conclusion: Signs of how they will feel about the querent in the future

            [Reading Guidelines]
            - Interpret all 7 cards holistically, not individually
            - Consider positions 2 (Obstacle), 5 (Subconscious), and 6 (How They Relate) together
            - Remember that the other person's feelings are their own and cannot be controlled
            - Provide a warm, thoughtful reading in English
            - End with specific actionable guidance for moving forward
            """
        }
    }

    // MARK: - Premium

    static var premiumMode: String {
        ja ? "プレミアムモード" : "Premium Mode"
    }
    static var premiumDescription: String {
        ja ? "AIリーディングと印刷機能をロック解除します。一度の購入で永久に利用できます。"
            : "Unlock AI readings and printing features. One-time purchase, yours forever."
    }
    static var purchasePremium: String {
        ja ? "プレミアムモードを購入" : "Purchase Premium Mode"
    }
    static var restorePurchases: String {
        ja ? "購入を復元" : "Restore Purchases"
    }
    static var premiumActive: String {
        ja ? "プレミアム有効" : "Premium Active"
    }
    static var premiumRequired: String {
        ja ? "プレミアムモードが必要です" : "Premium Mode Required"
    }
    static var premiumRequiredMessage: String {
        ja ? "この機能にはプレミアムモードが必要です。設定画面から購入できます。"
            : "This feature requires Premium Mode. You can purchase it from Settings."
    }
    static var premiumFeatureAI: String {
        ja ? "AI総合リーディング" : "AI Comprehensive Reading"
    }
    static var premiumFeaturePrint: String {
        ja ? "リーディング結果の印刷" : "Print Reading Results"
    }
    static var purchaseFailed: String {
        ja ? "購入に失敗しました" : "Purchase failed"
    }
    // MARK: - API Key Instructions

    static var apiKeyInstructions: String {
        ja ? "APIキーの取得方法" : "How to Get API Keys"
    }
    static var apiKeyInstructionsFooter: String {
        ja ? "各プロバイダーのウェブサイトでアカウントを作成し、APIキーを取得してください。"
            : "Create an account on each provider's website and obtain an API key."
    }
    static var openAIInstructions: String {
        ja ? """
            1. platform.openai.com にアクセス
            2. アカウントを作成またはログイン
            3. 左メニューから「API Keys」を選択
            4.「Create new secret key」をタップ
            5. sk- で始まるキーをコピー
            """
            : """
            1. Go to platform.openai.com
            2. Create an account or sign in
            3. Select "API Keys" from the left menu
            4. Tap "Create new secret key"
            5. Copy the key starting with sk-
            """
    }
    static var claudeInstructions: String {
        ja ? """
            1. console.anthropic.com にアクセス
            2. アカウントを作成またはログイン
            3.「API Keys」ページに移動
            4.「Create Key」をタップ
            5. sk-ant- で始まるキーをコピー
            """
            : """
            1. Go to console.anthropic.com
            2. Create an account or sign in
            3. Navigate to the "API Keys" page
            4. Tap "Create Key"
            5. Copy the key starting with sk-ant-
            """
    }
    static var geminiInstructions: String {
        ja ? """
            1. aistudio.google.com にアクセス
            2. Googleアカウントでログイン
            3.「Get API Key」をタップ
            4.「Create API Key」を選択
            5. AIza で始まるキーをコピー
            """
            : """
            1. Go to aistudio.google.com
            2. Sign in with your Google account
            3. Tap "Get API Key"
            4. Select "Create API Key"
            5. Copy the key starting with AIza
            """
    }

    // MARK: - Reset

    static var resetAllSettings: String {
        ja ? "全設定を消去" : "Reset All Settings"
    }
    static var resetConfirmTitle: String {
        ja ? "全設定を消去しますか？" : "Reset All Settings?"
    }
    static var resetConfirmMessage: String {
        ja ? "言語、名前、APIキーなどの全設定が消去されます。保存済みのリーディング履歴は残ります。"
            : "All settings including language, name, and API keys will be cleared. Saved reading history will be kept."
    }
    static var resetBtn: String {
        ja ? "消去" : "Reset"
    }
    static var cancel: String {
        ja ? "キャンセル" : "Cancel"
    }
}
