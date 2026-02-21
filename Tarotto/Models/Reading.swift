import Foundation
import SwiftData

@Model
final class Reading {
    var createdAt: Date
    var question: String
    var targetPerson: String
    @Relationship(deleteRule: .cascade, inverse: \DrawnCard.reading)
    var drawnCards: [DrawnCard]
    var notes: String
    var aiReading: String?

    init(question: String, targetPerson: String, drawnCards: [DrawnCard] = [], notes: String = "") {
        self.createdAt = Date()
        self.question = question
        self.targetPerson = targetPerson
        self.drawnCards = drawnCards
        self.notes = notes
    }
}
