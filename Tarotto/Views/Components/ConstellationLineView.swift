import SwiftUI

struct ConstellationLineView: View {
    var opacity: Double = 0.3

    // Bowl connections (quadrilateral)
    private let bowlConnections: [(Int, Int)] = [
        (0, 1), (1, 2), (2, 3), (3, 0)
    ]
    // Handle connections
    private let handleConnections: [(Int, Int)] = [
        (3, 4), (4, 5), (5, 6)
    ]

    var body: some View {
        Canvas { context, size in
            let positions = BigDipperLayout.starPositions.map { normalized in
                CGPoint(
                    x: normalized.x * size.width,
                    y: normalized.y * size.height
                )
            }

            // Draw lines
            var path = Path()
            for (from, to) in bowlConnections + handleConnections {
                path.move(to: positions[from])
                path.addLine(to: positions[to])
            }

            context.stroke(
                path,
                with: .color(TarottoTheme.cardGold.opacity(opacity)),
                lineWidth: 1.0
            )

            // Draw star dots
            for pos in positions {
                let starRect = CGRect(
                    x: pos.x - 3, y: pos.y - 3,
                    width: 6, height: 6
                )
                context.fill(
                    Path(ellipseIn: starRect),
                    with: .color(TarottoTheme.starWhite.opacity(opacity * 2))
                )

                // Outer glow
                let glowRect = CGRect(
                    x: pos.x - 6, y: pos.y - 6,
                    width: 12, height: 12
                )
                context.fill(
                    Path(ellipseIn: glowRect),
                    with: .color(TarottoTheme.cardGold.opacity(opacity * 0.3))
                )
            }
        }
    }
}

#Preview {
    ConstellationLineView(opacity: 0.5)
        .frame(width: 350, height: 450)
        .background(TarottoTheme.background)
}
