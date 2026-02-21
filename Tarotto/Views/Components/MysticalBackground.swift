import SwiftUI

struct MysticalBackground: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.04, green: 0.04, blue: 0.10),
                    Color(red: 0.06, green: 0.03, blue: 0.15),
                    Color(red: 0.03, green: 0.03, blue: 0.08)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            TimelineView(.animation(minimumInterval: 1.0 / 30.0)) { timeline in
                Canvas { context, size in
                    let time = timeline.date.timeIntervalSinceReferenceDate
                    for i in 0..<50 {
                        let seed = Double(i) * 137.508
                        let x = fmod(abs(sin(seed) * 1000), size.width)
                        let y = fmod(abs(cos(seed * 0.7) * 1000), size.height)
                        let twinkle = sin(time * (1.5 + Double(i % 5) * 0.3) + seed) * 0.5 + 0.5
                        let radius = CGFloat(0.5 + twinkle * 1.5)

                        let rect = CGRect(
                            x: x - radius, y: y - radius,
                            width: radius * 2, height: radius * 2
                        )
                        context.fill(
                            Path(ellipseIn: rect),
                            with: .color(.white.opacity(twinkle * 0.7))
                        )
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MysticalBackground()
}
