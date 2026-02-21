import SwiftUI

struct PlaceholderCardImage: View {
    let card: TarotCard
    let orientation: CardOrientation

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: TarottoTheme.cardCornerRadius)
                .fill(
                    LinearGradient(
                        colors: [
                            suitColor.opacity(0.8),
                            TarottoTheme.background
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            RoundedRectangle(cornerRadius: TarottoTheme.cardCornerRadius)
                .stroke(
                    orientation == .reversed ? TarottoTheme.reversedRed : TarottoTheme.cardGold,
                    lineWidth: 1.5
                )

            RoundedRectangle(cornerRadius: TarottoTheme.cardCornerRadius - 3)
                .stroke(
                    (orientation == .reversed ? TarottoTheme.reversedRed : TarottoTheme.cardGold).opacity(0.3),
                    lineWidth: 0.5
                )
                .padding(4)

            VStack(spacing: 4) {
                Text(card.number)
                    .font(.system(size: 12, weight: .bold, design: .serif))
                    .foregroundStyle(TarottoTheme.cardGold)

                if let suit = card.suit {
                    Image(systemName: suit.sfSymbolName)
                        .font(.title3)
                        .foregroundStyle(TarottoTheme.cardGold)
                } else {
                    Image(systemName: majorArcanaSymbol)
                        .font(.title3)
                        .foregroundStyle(TarottoTheme.cardGold)
                }

                Text(card.localizedName)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundStyle(TarottoTheme.starWhite)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .minimumScaleFactor(0.7)

                if orientation == .reversed {
                    Text(orientation.localizedName)
                        .font(.system(size: 9, weight: .bold))
                        .foregroundStyle(TarottoTheme.reversedRed)
                }
            }
            .padding(6)
        }
    }

    private var suitColor: Color {
        if card.isMajorArcana {
            return TarottoTheme.accentPurple
        }
        switch card.suit {
        case .wands: return Color(red: 0.7, green: 0.3, blue: 0.1)
        case .cups: return Color(red: 0.2, green: 0.3, blue: 0.7)
        case .swords: return Color(red: 0.4, green: 0.4, blue: 0.5)
        case .pentacles: return Color(red: 0.3, green: 0.5, blue: 0.2)
        case .none: return TarottoTheme.accentPurple
        }
    }

    private var majorArcanaSymbol: String {
        switch card {
        case .theFool: return "figure.walk"
        case .theMagician: return "wand.and.stars"
        case .theHighPriestess: return "moon.fill"
        case .theEmpress: return "crown.fill"
        case .theEmperor: return "shield.fill"
        case .theHierophant: return "book.closed.fill"
        case .theLovers: return "heart.fill"
        case .theChariot: return "car.fill"
        case .strength: return "lion.fill"
        case .theHermit: return "flashlight.on.fill"
        case .wheelOfFortune: return "circle.dotted"
        case .justice: return "scale.3d"
        case .theHangedMan: return "arrow.down.circle.fill"
        case .death: return "leaf.fill"
        case .temperance: return "drop.triangle.fill"
        case .theDevil: return "flame.fill"
        case .theTower: return "bolt.fill"
        case .theStar: return "star.fill"
        case .theMoon: return "moon.stars.fill"
        case .theSun: return "sun.max.fill"
        case .judgement: return "horn.blast.fill"
        case .theWorld: return "globe.asia.australia.fill"
        default: return "star.fill"
        }
    }
}

struct CardBackView: View {
    var body: some View {
        if let uiImage = CardImageLoader.cachedImage(named: "CardBacks") {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(7.0 / 10.0, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: TarottoTheme.cardCornerRadius))
        } else {
            ZStack {
                RoundedRectangle(cornerRadius: TarottoTheme.cardCornerRadius)
                    .fill(
                        LinearGradient(
                            colors: [
                                TarottoTheme.deepPurple,
                                Color(red: 0.08, green: 0.05, blue: 0.18)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )

                RoundedRectangle(cornerRadius: TarottoTheme.cardCornerRadius)
                    .stroke(TarottoTheme.cardGold, lineWidth: 1.5)

                // Inner decorative border
                RoundedRectangle(cornerRadius: TarottoTheme.cardCornerRadius - 4)
                    .stroke(TarottoTheme.cardGold.opacity(0.4), lineWidth: 0.5)
                    .padding(5)

                // Center pattern
                VStack(spacing: 6) {
                    Image(systemName: "star.fill")
                        .font(.system(size: 8))
                    Image(systemName: "sparkle")
                        .font(.system(size: 16))
                    Image(systemName: "star.fill")
                        .font(.system(size: 8))
                }
                .foregroundStyle(TarottoTheme.cardGold.opacity(0.6))
            }
        }
    }
}

#Preview {
    HStack(spacing: 12) {
        PlaceholderCardImage(card: .theFool, orientation: .upright)
            .frame(width: 70, height: 100)
        PlaceholderCardImage(card: .cupsAce, orientation: .reversed)
            .frame(width: 70, height: 100)
        CardBackView()
            .frame(width: 70, height: 100)
    }
    .padding()
    .background(TarottoTheme.background)
}
