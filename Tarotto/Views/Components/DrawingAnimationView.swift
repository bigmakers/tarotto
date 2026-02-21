import SwiftUI

struct DrawingAnimationView: View {
    let onComplete: () -> Void

    @State private var drawnCount = 0
    @State private var currentCount = 0
    @State private var showPulse = false
    @State private var isAnimating = false

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Text(L.drawingEvery7th)
                .font(.subheadline)
                .foregroundStyle(TarottoTheme.textSilver)

            // Deck visual
            ZStack {
                // Remaining deck
                ForEach(0..<8, id: \.self) { i in
                    CardBackView()
                        .frame(width: 56, height: 80)
                        .offset(x: CGFloat(i) * 0.4, y: -CGFloat(i) * 0.4)
                }

                // Current card being counted
                if isAnimating {
                    CardBackView()
                        .frame(width: 56, height: 80)
                        .overlay(
                            RoundedRectangle(cornerRadius: TarottoTheme.cardCornerRadius)
                                .stroke(
                                    currentCount % 7 == 0 && currentCount > 0
                                        ? TarottoTheme.cardGold
                                        : TarottoTheme.textSilver.opacity(0.5),
                                    lineWidth: currentCount % 7 == 0 && currentCount > 0 ? 3 : 1
                                )
                        )
                        .offset(y: -30)
                        .scaleEffect(showPulse ? 1.1 : 1.0)
                }
            }
            .frame(height: 140)

            // Counter
            HStack(spacing: 4) {
                Text("\(currentCount % 7 == 0 && currentCount > 0 ? 7 : currentCount % 7)")
                    .font(.system(size: 36, weight: .bold, design: .serif))
                    .foregroundStyle(
                        currentCount % 7 == 0 && currentCount > 0
                            ? TarottoTheme.cardGold
                            : TarottoTheme.starWhite
                    )
                    .contentTransition(.numericText())
                Text("/ 7")
                    .font(.title3)
                    .foregroundStyle(TarottoTheme.textSilver.opacity(0.5))
            }

            // Drawn cards slots
            HStack(spacing: 8) {
                ForEach(0..<7, id: \.self) { i in
                    if i < drawnCount {
                        CardBackView()
                            .frame(width: 36, height: 52)
                            .glow(TarottoTheme.cardGold, radius: 4)
                            .transition(.scale.combined(with: .opacity))
                    } else {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(
                                TarottoTheme.textSilver.opacity(0.2),
                                style: StrokeStyle(lineWidth: 1, dash: [4])
                            )
                            .frame(width: 36, height: 52)
                    }
                }
            }
            .animation(.spring(duration: 0.4), value: drawnCount)

            Text(L.drawnCardsCount(drawnCount))
                .font(.caption)
                .foregroundStyle(TarottoTheme.textSilver)

            Spacer()
        }
        .onAppear {
            startDrawingAnimation()
        }
    }

    private func startDrawingAnimation() {
        isAnimating = true
        var count = 0
        let totalCards = 49 // 7 draws x 7 interval

        Timer.scheduledTimer(withTimeInterval: 0.12, repeats: true) { timer in
            count += 1
            withAnimation(.easeInOut(duration: 0.1)) {
                currentCount = count
            }

            if count % 7 == 0 {
                withAnimation(.spring(duration: 0.3)) {
                    showPulse = true
                    drawnCount = count / 7
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation { showPulse = false }
                }
            }

            if count >= totalCards {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    onComplete()
                }
            }
        }
    }
}
