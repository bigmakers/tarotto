import Foundation

enum TarotCard: Int, CaseIterable, Identifiable, Codable {
    // MARK: - Major Arcana (0-21)
    case theFool = 0
    case theMagician = 1
    case theHighPriestess = 2
    case theEmpress = 3
    case theEmperor = 4
    case theHierophant = 5
    case theLovers = 6
    case theChariot = 7
    case strength = 8
    case theHermit = 9
    case wheelOfFortune = 10
    case justice = 11
    case theHangedMan = 12
    case death = 13
    case temperance = 14
    case theDevil = 15
    case theTower = 16
    case theStar = 17
    case theMoon = 18
    case theSun = 19
    case judgement = 20
    case theWorld = 21

    // MARK: - Wands (22-35)
    case wandsAce = 22
    case wands2 = 23
    case wands3 = 24
    case wands4 = 25
    case wands5 = 26
    case wands6 = 27
    case wands7 = 28
    case wands8 = 29
    case wands9 = 30
    case wands10 = 31
    case wandsPage = 32
    case wandsKnight = 33
    case wandsQueen = 34
    case wandsKing = 35

    // MARK: - Cups (36-49)
    case cupsAce = 36
    case cups2 = 37
    case cups3 = 38
    case cups4 = 39
    case cups5 = 40
    case cups6 = 41
    case cups7 = 42
    case cups8 = 43
    case cups9 = 44
    case cups10 = 45
    case cupsPage = 46
    case cupsKnight = 47
    case cupsQueen = 48
    case cupsKing = 49

    // MARK: - Swords (50-63)
    case swordsAce = 50
    case swords2 = 51
    case swords3 = 52
    case swords4 = 53
    case swords5 = 54
    case swords6 = 55
    case swords7 = 56
    case swords8 = 57
    case swords9 = 58
    case swords10 = 59
    case swordsPage = 60
    case swordsKnight = 61
    case swordsQueen = 62
    case swordsKing = 63

    // MARK: - Pentacles (64-77)
    case pentaclesAce = 64
    case pentacles2 = 65
    case pentacles3 = 66
    case pentacles4 = 67
    case pentacles5 = 68
    case pentacles6 = 69
    case pentacles7 = 70
    case pentacles8 = 71
    case pentacles9 = 72
    case pentacles10 = 73
    case pentaclesPage = 74
    case pentaclesKnight = 75
    case pentaclesQueen = 76
    case pentaclesKing = 77

    var id: Int { rawValue }

    var isMajorArcana: Bool { rawValue <= 21 }

    var suit: CardSuit? {
        switch rawValue {
        case 22...35: return .wands
        case 36...49: return .cups
        case 50...63: return .swords
        case 64...77: return .pentacles
        default: return nil
        }
    }

    var rankInSuit: Int? {
        guard !isMajorArcana else { return nil }
        return (rawValue - 22) % 14 + 1
    }

    var number: String {
        if isMajorArcana {
            return String(format: "%02d", rawValue)
        }
        guard let rank = rankInSuit else { return "" }
        switch rank {
        case 1: return "A"
        case 11: return "P"
        case 12: return "Kn"
        case 13: return "Q"
        case 14: return "K"
        default: return "\(rank)"
        }
    }

    var japaneseName: String {
        switch self {
        // Major Arcana
        case .theFool: return "愚者"
        case .theMagician: return "魔術師"
        case .theHighPriestess: return "女教皇"
        case .theEmpress: return "女帝"
        case .theEmperor: return "皇帝"
        case .theHierophant: return "教皇"
        case .theLovers: return "恋人"
        case .theChariot: return "戦車"
        case .strength: return "力"
        case .theHermit: return "隠者"
        case .wheelOfFortune: return "運命の輪"
        case .justice: return "正義"
        case .theHangedMan: return "吊された男"
        case .death: return "死神"
        case .temperance: return "節制"
        case .theDevil: return "悪魔"
        case .theTower: return "塔"
        case .theStar: return "星"
        case .theMoon: return "月"
        case .theSun: return "太陽"
        case .judgement: return "審判"
        case .theWorld: return "世界"
        // Wands
        case .wandsAce: return "ワンドのエース"
        case .wands2: return "ワンドの2"
        case .wands3: return "ワンドの3"
        case .wands4: return "ワンドの4"
        case .wands5: return "ワンドの5"
        case .wands6: return "ワンドの6"
        case .wands7: return "ワンドの7"
        case .wands8: return "ワンドの8"
        case .wands9: return "ワンドの9"
        case .wands10: return "ワンドの10"
        case .wandsPage: return "ワンドのペイジ"
        case .wandsKnight: return "ワンドのナイト"
        case .wandsQueen: return "ワンドのクイーン"
        case .wandsKing: return "ワンドのキング"
        // Cups
        case .cupsAce: return "カップのエース"
        case .cups2: return "カップの2"
        case .cups3: return "カップの3"
        case .cups4: return "カップの4"
        case .cups5: return "カップの5"
        case .cups6: return "カップの6"
        case .cups7: return "カップの7"
        case .cups8: return "カップの8"
        case .cups9: return "カップの9"
        case .cups10: return "カップの10"
        case .cupsPage: return "カップのペイジ"
        case .cupsKnight: return "カップのナイト"
        case .cupsQueen: return "カップのクイーン"
        case .cupsKing: return "カップのキング"
        // Swords
        case .swordsAce: return "ソードのエース"
        case .swords2: return "ソードの2"
        case .swords3: return "ソードの3"
        case .swords4: return "ソードの4"
        case .swords5: return "ソードの5"
        case .swords6: return "ソードの6"
        case .swords7: return "ソードの7"
        case .swords8: return "ソードの8"
        case .swords9: return "ソードの9"
        case .swords10: return "ソードの10"
        case .swordsPage: return "ソードのペイジ"
        case .swordsKnight: return "ソードのナイト"
        case .swordsQueen: return "ソードのクイーン"
        case .swordsKing: return "ソードのキング"
        // Pentacles
        case .pentaclesAce: return "ペンタクルのエース"
        case .pentacles2: return "ペンタクルの2"
        case .pentacles3: return "ペンタクルの3"
        case .pentacles4: return "ペンタクルの4"
        case .pentacles5: return "ペンタクルの5"
        case .pentacles6: return "ペンタクルの6"
        case .pentacles7: return "ペンタクルの7"
        case .pentacles8: return "ペンタクルの8"
        case .pentacles9: return "ペンタクルの9"
        case .pentacles10: return "ペンタクルの10"
        case .pentaclesPage: return "ペンタクルのペイジ"
        case .pentaclesKnight: return "ペンタクルのナイト"
        case .pentaclesQueen: return "ペンタクルのクイーン"
        case .pentaclesKing: return "ペンタクルのキング"
        }
    }

    var englishName: String {
        switch self {
        // Major Arcana
        case .theFool: return "The Fool"
        case .theMagician: return "The Magician"
        case .theHighPriestess: return "The High Priestess"
        case .theEmpress: return "The Empress"
        case .theEmperor: return "The Emperor"
        case .theHierophant: return "The Hierophant"
        case .theLovers: return "The Lovers"
        case .theChariot: return "The Chariot"
        case .strength: return "Strength"
        case .theHermit: return "The Hermit"
        case .wheelOfFortune: return "Wheel of Fortune"
        case .justice: return "Justice"
        case .theHangedMan: return "The Hanged Man"
        case .death: return "Death"
        case .temperance: return "Temperance"
        case .theDevil: return "The Devil"
        case .theTower: return "The Tower"
        case .theStar: return "The Star"
        case .theMoon: return "The Moon"
        case .theSun: return "The Sun"
        case .judgement: return "Judgement"
        case .theWorld: return "The World"
        // Wands
        case .wandsAce: return "Ace of Wands"
        case .wands2: return "Two of Wands"
        case .wands3: return "Three of Wands"
        case .wands4: return "Four of Wands"
        case .wands5: return "Five of Wands"
        case .wands6: return "Six of Wands"
        case .wands7: return "Seven of Wands"
        case .wands8: return "Eight of Wands"
        case .wands9: return "Nine of Wands"
        case .wands10: return "Ten of Wands"
        case .wandsPage: return "Page of Wands"
        case .wandsKnight: return "Knight of Wands"
        case .wandsQueen: return "Queen of Wands"
        case .wandsKing: return "King of Wands"
        // Cups
        case .cupsAce: return "Ace of Cups"
        case .cups2: return "Two of Cups"
        case .cups3: return "Three of Cups"
        case .cups4: return "Four of Cups"
        case .cups5: return "Five of Cups"
        case .cups6: return "Six of Cups"
        case .cups7: return "Seven of Cups"
        case .cups8: return "Eight of Cups"
        case .cups9: return "Nine of Cups"
        case .cups10: return "Ten of Cups"
        case .cupsPage: return "Page of Cups"
        case .cupsKnight: return "Knight of Cups"
        case .cupsQueen: return "Queen of Cups"
        case .cupsKing: return "King of Cups"
        // Swords
        case .swordsAce: return "Ace of Swords"
        case .swords2: return "Two of Swords"
        case .swords3: return "Three of Swords"
        case .swords4: return "Four of Swords"
        case .swords5: return "Five of Swords"
        case .swords6: return "Six of Swords"
        case .swords7: return "Seven of Swords"
        case .swords8: return "Eight of Swords"
        case .swords9: return "Nine of Swords"
        case .swords10: return "Ten of Swords"
        case .swordsPage: return "Page of Swords"
        case .swordsKnight: return "Knight of Swords"
        case .swordsQueen: return "Queen of Swords"
        case .swordsKing: return "King of Swords"
        // Pentacles
        case .pentaclesAce: return "Ace of Pentacles"
        case .pentacles2: return "Two of Pentacles"
        case .pentacles3: return "Three of Pentacles"
        case .pentacles4: return "Four of Pentacles"
        case .pentacles5: return "Five of Pentacles"
        case .pentacles6: return "Six of Pentacles"
        case .pentacles7: return "Seven of Pentacles"
        case .pentacles8: return "Eight of Pentacles"
        case .pentacles9: return "Nine of Pentacles"
        case .pentacles10: return "Ten of Pentacles"
        case .pentaclesPage: return "Page of Pentacles"
        case .pentaclesKnight: return "Knight of Pentacles"
        case .pentaclesQueen: return "Queen of Pentacles"
        case .pentaclesKing: return "King of Pentacles"
        }
    }

    var localizedName: String {
        L.cardName(self)
    }

    var imageName: String {
        switch self {
        case .theFool: return "00-TheFool"
        case .theMagician: return "01-TheMagician"
        case .theHighPriestess: return "02-TheHighPriestess"
        case .theEmpress: return "03-TheEmpress"
        case .theEmperor: return "04-TheEmperor"
        case .theHierophant: return "05-TheHierophant"
        case .theLovers: return "06-TheLovers"
        case .theChariot: return "07-TheChariot"
        case .strength: return "08-Strength"
        case .theHermit: return "09-TheHermit"
        case .wheelOfFortune: return "10-WheelOfFortune"
        case .justice: return "11-Justice"
        case .theHangedMan: return "12-TheHangedMan"
        case .death: return "13-Death"
        case .temperance: return "14-Temperance"
        case .theDevil: return "15-TheDevil"
        case .theTower: return "16-TheTower"
        case .theStar: return "17-TheStar"
        case .theMoon: return "18-TheMoon"
        case .theSun: return "19-TheSun"
        case .judgement: return "20-Judgement"
        case .theWorld: return "21-TheWorld"
        default:
            guard let suit = suit, let rank = rankInSuit else { return "CardBacks" }
            let suitName: String
            switch suit {
            case .wands: suitName = "Wands"
            case .cups: suitName = "Cups"
            case .swords: suitName = "Swords"
            case .pentacles: suitName = "Pentacles"
            }
            return "\(suitName)\(String(format: "%02d", rank))"
        }
    }
}
