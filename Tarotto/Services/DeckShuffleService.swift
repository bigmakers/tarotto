import Foundation

struct DeckShuffleService {
    /// Shuffles the full 78-card deck and draws every 7th card.
    /// Returns exactly 7 DrawnCard values with random orientations.
    func performReading() -> [DrawnCard] {
        let deck = TarotCard.allCases.shuffled()
        var drawnCards: [DrawnCard] = []

        for i in 0..<7 {
            let index = (i + 1) * 7 - 1 // 6, 13, 20, 27, 34, 41, 48
            let card = deck[index]
            let orientation: CardOrientation = Bool.random() ? .upright : .reversed
            let position = SpreadPosition(rawValue: i)!
            drawnCards.append(DrawnCard(card: card, orientation: orientation, position: position))
        }

        return drawnCards
    }
}
