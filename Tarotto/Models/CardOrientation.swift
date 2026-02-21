import Foundation

enum CardOrientation: String, Codable {
    case upright
    case reversed

    var japaneseName: String {
        switch self {
        case .upright: return "正位置"
        case .reversed: return "逆位置"
        }
    }

    var localizedName: String {
        L.orientationName(self)
    }
}
