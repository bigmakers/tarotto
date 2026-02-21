import Foundation

enum CardSuit: String, Codable, CaseIterable {
    case wands
    case cups
    case swords
    case pentacles

    var japaneseName: String {
        switch self {
        case .wands: return "ワンド"
        case .cups: return "カップ"
        case .swords: return "ソード"
        case .pentacles: return "ペンタクル"
        }
    }

    var element: String {
        switch self {
        case .wands: return "火"
        case .cups: return "水"
        case .swords: return "風"
        case .pentacles: return "地"
        }
    }

    var sfSymbolName: String {
        switch self {
        case .wands: return "flame.fill"
        case .cups: return "drop.fill"
        case .swords: return "wind"
        case .pentacles: return "circle.hexagongrid.fill"
        }
    }
}
