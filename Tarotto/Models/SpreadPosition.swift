import Foundation

enum SpreadPosition: Int, CaseIterable, Codable, Identifiable {
    case currentSituation = 0
    case causeObstacle = 1
    case pastFeelings = 2
    case currentFeelings = 3
    case subconscious = 4
    case howTheyRelate = 5
    case futureFeelings = 6

    var id: Int { rawValue }

    var displayNumber: Int { rawValue + 1 }

    var japaneseName: String {
        switch self {
        case .currentSituation: return "現在の状況"
        case .causeObstacle: return "原因・妨害"
        case .pastFeelings: return "過去の気持ち"
        case .currentFeelings: return "現在の気持ち"
        case .subconscious: return "潜在意識"
        case .howTheyRelate: return "あなたへの関わり方"
        case .futureFeelings: return "今後の気持ち・結論"
        }
    }

    var localizedName: String {
        L.positionName(self)
    }

    var japaneseDescription: String {
        switch self {
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
    }

    var localizedDescription: String {
        L.positionDescription(self)
    }

    var starName: String {
        L.starName(self)
    }
}
