import Foundation

struct CardInterpretation {
    let keywords: [String]
    let generalMeaning: String
    let feelingsContext: String
    let advice: String
}

struct CardMeanings {
    let upright: CardInterpretation
    let reversed: CardInterpretation
}

enum CardInterpretations {
    static var all: [TarotCard: CardMeanings] {
        AppSettings.shared.isJapanese ? japaneseAll : englishAll
    }

    private static let japaneseAll: [TarotCard: CardMeanings] = {
        var dict = [TarotCard: CardMeanings]()
        dict.merge(MajorArcanaInterpretations.all) { _, new in new }
        dict.merge(WandsInterpretations.all) { _, new in new }
        dict.merge(CupsInterpretations.all) { _, new in new }
        dict.merge(SwordsInterpretations.all) { _, new in new }
        dict.merge(PentaclesInterpretations.all) { _, new in new }
        return dict
    }()

    private static let englishAll: [TarotCard: CardMeanings] = {
        var dict = [TarotCard: CardMeanings]()
        dict.merge(MajorArcanaInterpretationsEN.all) { _, new in new }
        dict.merge(WandsInterpretationsEN.all) { _, new in new }
        dict.merge(CupsInterpretationsEN.all) { _, new in new }
        dict.merge(SwordsInterpretationsEN.all) { _, new in new }
        dict.merge(PentaclesInterpretationsEN.all) { _, new in new }
        return dict
    }()
}
