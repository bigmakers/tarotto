import SwiftUI

struct BigDipperLayout: Layout {
    var animationProgress: CGFloat = 1.0

    // Normalized positions (0...1) for the Big Dipper constellation
    // Bowl: Dubhe(0), Merak(1), Phecda(2), Megrez(3)
    // Handle: Alioth(4), Mizar(5), Alkaid(6)
    static let starPositions: [CGPoint] = [
        CGPoint(x: 0.15, y: 0.12),  // 0: 天樞 Dubhe (top-left of bowl)
        CGPoint(x: 0.12, y: 0.48),  // 1: 天璇 Merak (bottom-left of bowl)
        CGPoint(x: 0.40, y: 0.55),  // 2: 天璣 Phecda (bottom-right of bowl)
        CGPoint(x: 0.43, y: 0.22),  // 3: 天權 Megrez (top-right of bowl / junction)
        CGPoint(x: 0.62, y: 0.28),  // 4: 玉衡 Alioth (first handle)
        CGPoint(x: 0.78, y: 0.36),  // 5: 開陽 Mizar (middle handle)
        CGPoint(x: 0.92, y: 0.52),  // 6: 搖光 Alkaid (tip of handle)
    ]

    struct CacheData {
        let cardSize: CGSize
    }

    func makeCache(subviews: Subviews) -> CacheData {
        CacheData(cardSize: CGSize(width: 70, height: 100))
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) -> CGSize {
        let width = proposal.width ?? 350
        let height = proposal.height ?? 450
        return CGSize(width: width, height: height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        let cardProposal = ProposedViewSize(cache.cardSize)
        let center = CGPoint(x: bounds.midX, y: bounds.midY)

        for (index, subview) in subviews.enumerated() {
            guard index < Self.starPositions.count else { break }

            let normalized = Self.starPositions[index]
            let targetX = bounds.minX + normalized.x * bounds.width
            let targetY = bounds.minY + normalized.y * bounds.height

            let x = center.x + (targetX - center.x) * animationProgress
            let y = center.y + (targetY - center.y) * animationProgress

            subview.place(
                at: CGPoint(x: x, y: y),
                anchor: .center,
                proposal: cardProposal
            )
        }
    }
}

struct BigDipperLayoutAnimatable: Layout, Animatable {
    var animationProgress: CGFloat = 1.0

    var animatableData: CGFloat {
        get { animationProgress }
        set { animationProgress = newValue }
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let width = proposal.width ?? 350
        let height = proposal.height ?? 450
        return CGSize(width: width, height: height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let cardProposal = ProposedViewSize(width: 70, height: 100)
        let center = CGPoint(x: bounds.midX, y: bounds.midY)

        for (index, subview) in subviews.enumerated() {
            guard index < BigDipperLayout.starPositions.count else { break }

            let normalized = BigDipperLayout.starPositions[index]
            let targetX = bounds.minX + normalized.x * bounds.width
            let targetY = bounds.minY + normalized.y * bounds.height

            let x = center.x + (targetX - center.x) * animationProgress
            let y = center.y + (targetY - center.y) * animationProgress

            subview.place(
                at: CGPoint(x: x, y: y),
                anchor: .center,
                proposal: cardProposal
            )
        }
    }
}
