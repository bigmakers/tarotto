import SwiftUI

struct CardFlipModifier: AnimatableModifier {
    var rotationAngle: Double

    var animatableData: Double {
        get { rotationAngle }
        set { rotationAngle = newValue }
    }

    func body(content: Content) -> some View {
        content
            .scaleEffect(x: -1, y: 1)
            .rotation3DEffect(
                .degrees(rotationAngle),
                axis: (x: 0, y: 1, z: 0),
                perspective: 0.5
            )
            .opacity(rotationAngle < 90 ? 0 : 1)
    }
}

struct CardBackFlipModifier: AnimatableModifier {
    var rotationAngle: Double

    var animatableData: Double {
        get { rotationAngle }
        set { rotationAngle = newValue }
    }

    func body(content: Content) -> some View {
        content
            .rotation3DEffect(
                .degrees(rotationAngle + 180),
                axis: (x: 0, y: 1, z: 0),
                perspective: 0.5
            )
            .opacity(rotationAngle < 90 ? 1 : 0)
    }
}
