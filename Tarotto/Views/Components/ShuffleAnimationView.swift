import SwiftUI

struct ShuffleAnimationView: View {
    let onComplete: () -> Void

    @State private var cardOffsets: [CGSize] = Array(repeating: .zero, count: 12)
    @State private var cardRotations: [Double] = Array(repeating: 0, count: 12)
    @State private var phase = 0
    @State private var statusText = L.calmYourMind

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            ZStack {
                ForEach(0..<12, id: \.self) { index in
                    CardBackView()
                        .frame(width: 60, height: 86)
                        .offset(cardOffsets[index])
                        .rotationEffect(.degrees(cardRotations[index]))
                        .zIndex(Double(index))
                }
            }
            .frame(height: 200)

            Text(statusText)
                .font(.subheadline)
                .foregroundStyle(TarottoTheme.textSilver)
                .animation(.easeInOut, value: statusText)

            Spacer()
        }
        .onAppear {
            runShuffleSequence()
        }
    }

    private func runShuffleSequence() {
        // Phase 1: Fan out
        withAnimation(.spring(duration: 0.6)) {
            for i in 0..<12 {
                let angle = Double(i - 6) * 8.0
                cardRotations[i] = angle
                cardOffsets[i] = CGSize(
                    width: CGFloat(i - 6) * 18,
                    height: abs(CGFloat(i - 6)) * -4
                )
            }
            statusText = L.spreadingCards
        }

        // Phase 2: Gather and riffle
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation(.spring(duration: 0.5)) {
                for i in 0..<12 {
                    cardOffsets[i] = CGSize(
                        width: CGFloat.random(in: -30...30),
                        height: CGFloat.random(in: -20...20)
                    )
                    cardRotations[i] = Double.random(in: -15...15)
                }
                statusText = L.shuffling
            }
        }

        // Phase 3: Scatter and re-gather
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.spring(duration: 0.5)) {
                for i in 0..<12 {
                    cardOffsets[i] = CGSize(
                        width: CGFloat.random(in: -50...50),
                        height: CGFloat.random(in: -30...30)
                    )
                    cardRotations[i] = Double.random(in: -25...25)
                }
            }
        }

        // Phase 4: Stack neatly
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
            withAnimation(.spring(duration: 0.5)) {
                for i in 0..<12 {
                    cardOffsets[i] = CGSize(
                        width: CGFloat(i) * 0.5,
                        height: CGFloat(i) * -0.5
                    )
                    cardRotations[i] = 0
                }
                statusText = L.drawingCardsPrompt
            }
        }

        // Complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            onComplete()
        }
    }
}
