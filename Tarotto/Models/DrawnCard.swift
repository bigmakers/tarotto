import Foundation
import SwiftData

@Model
final class DrawnCard {
    var cardRawValue: Int
    var orientationRawValue: String
    var positionRawValue: Int
    var reading: Reading?

    var card: TarotCard { TarotCard(rawValue: cardRawValue)! }
    var orientation: CardOrientation { CardOrientation(rawValue: orientationRawValue)! }
    var position: SpreadPosition { SpreadPosition(rawValue: positionRawValue)! }

    init(card: TarotCard, orientation: CardOrientation, position: SpreadPosition) {
        self.cardRawValue = card.rawValue
        self.orientationRawValue = orientation.rawValue
        self.positionRawValue = position.rawValue
    }
}
