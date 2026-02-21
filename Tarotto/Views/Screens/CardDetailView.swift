import SwiftUI

struct CardDetailView: View {
    let drawnCard: DrawnCard
    @Environment(\.dismiss) private var dismiss

    private var interpretation: CardInterpretation? {
        guard let meanings = CardInterpretations.all[drawnCard.card] else { return nil }
        return drawnCard.orientation == .upright ? meanings.upright : meanings.reversed
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Position info
                    VStack(spacing: 4) {
                        HStack(spacing: 4) {
                            Text(L.starLabel(drawnCard.position.displayNumber, drawnCard.position.starName))
                                .font(.subheadline)
                            Text("\u{300C}\(drawnCard.position.starName)\u{300D}")
                                .font(.subheadline)
                        }
                        .foregroundStyle(TarottoTheme.cardGold)

                        Text(drawnCard.position.localizedName)
                            .font(.title2.bold())
                            .foregroundStyle(TarottoTheme.starWhite)

                        Text(drawnCard.position.localizedDescription)
                            .font(.subheadline)
                            .foregroundStyle(TarottoTheme.textSilver)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }

                    // Card image
                    CardFrontView(card: drawnCard.card, orientation: drawnCard.orientation)
                        .frame(width: TarottoTheme.detailCardWidth, height: TarottoTheme.detailCardHeight)
                        .glow(TarottoTheme.cardGold, radius: 10)

                    // Card name + orientation
                    VStack(spacing: 4) {
                        Text(drawnCard.card.localizedName)
                            .font(.title3.bold())
                            .foregroundStyle(TarottoTheme.starWhite)
                        Text(drawnCard.orientation.localizedName)
                            .font(.subheadline.bold())
                            .foregroundStyle(
                                drawnCard.orientation == .upright
                                    ? TarottoTheme.cardGold
                                    : TarottoTheme.reversedRed
                            )
                    }

                    if let interpretation {
                        Divider()
                            .background(TarottoTheme.cardGold.opacity(0.3))
                            .padding(.horizontal)

                        // Keywords
                        keywordsSection(interpretation.keywords)

                        // Feelings interpretation (primary)
                        interpretationSection(
                            icon: "heart.fill",
                            title: L.feelingsInterpretation,
                            text: interpretation.feelingsContext,
                            isPrimary: true
                        )

                        // General meaning
                        interpretationSection(
                            icon: "sparkles",
                            title: L.generalMeaning,
                            text: interpretation.generalMeaning,
                            isPrimary: false
                        )

                        // Advice
                        adviceSection(interpretation.advice)
                    }
                }
                .padding()
                .padding(.bottom, 30)
            }
            .background(TarottoTheme.background)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(L.close) { dismiss() }
                        .foregroundStyle(TarottoTheme.cardGold)
                }
            }
        }
        .presentationDetents([.large])
    }

    private func keywordsSection(_ keywords: [String]) -> some View {
        FlowLayoutView(items: keywords) { keyword in
            Text(keyword)
                .font(.subheadline)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                        .fill(TarottoTheme.accentPurple.opacity(0.25))
                        .overlay(
                            Capsule()
                                .stroke(TarottoTheme.cardGold.opacity(0.4), lineWidth: 0.5)
                        )
                )
                .foregroundStyle(TarottoTheme.starWhite)
        }
        .padding(.horizontal)
    }

    private func interpretationSection(icon: String, title: String, text: String, isPrimary: Bool) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Label(title, systemImage: icon)
                .font(.headline)
                .foregroundStyle(TarottoTheme.cardGold)

            Text(text)
                .font(.body)
                .foregroundStyle(isPrimary ? TarottoTheme.starWhite : TarottoTheme.textSilver)
                .lineSpacing(6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isPrimary
                    ? TarottoTheme.accentPurple.opacity(0.15)
                    : TarottoTheme.accentPurple.opacity(0.05)
                )
        )
        .padding(.horizontal)
    }

    private func adviceSection(_ advice: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "lightbulb.fill")
                .foregroundStyle(TarottoTheme.cardGold)
            Text(advice)
                .font(.body)
                .foregroundStyle(TarottoTheme.starWhite)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(TarottoTheme.cardGold.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(TarottoTheme.cardGold.opacity(0.2), lineWidth: 0.5)
                )
        )
        .padding(.horizontal)
    }
}

// MARK: - Flow Layout

struct FlowLayoutView<Item: Hashable, Content: View>: View {
    let items: [Item]
    let content: (Item) -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            WrappingHStack(items: items, content: content)
        }
    }
}

struct WrappingHStack<Item: Hashable, Content: View>: View {
    let items: [Item]
    let content: (Item) -> Content

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(items, id: \.self) { item in
                    content(item)
                }
            }
        }
    }
}
