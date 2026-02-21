import SwiftUI

// MARK: - Bundle画像読み込みヘルパー

enum CardImageLoader {
    /// バンドル内のPNGファイルからUIImageを読み込む
    static func loadImage(named name: String) -> UIImage? {
        // まずアセットカタログから探す
        if let img = UIImage(named: name) {
            return img
        }
        // 次にバンドルのPNGファイルから探す
        if let path = Bundle.main.path(forResource: name, ofType: "png"),
           let img = UIImage(contentsOfFile: path) {
            return img
        }
        return nil
    }

    /// キャッシュ付き画像取得
    private static var cache = NSCache<NSString, UIImage>()

    static func cachedImage(named name: String) -> UIImage? {
        let key = name as NSString
        if let cached = cache.object(forKey: key) {
            return cached
        }
        if let img = loadImage(named: name) {
            cache.setObject(img, forKey: key)
            return img
        }
        return nil
    }
}

struct CardFlipView: View {
    let card: TarotCard
    let orientation: CardOrientation
    let isRevealed: Bool
    var onTap: (() -> Void)?

    @State private var rotationAngle: Double = 0

    var body: some View {
        ZStack {
            CardBackView()
                .modifier(CardBackFlipModifier(rotationAngle: rotationAngle))

            CardFrontView(card: card, orientation: orientation)
                .modifier(CardFlipModifier(rotationAngle: rotationAngle))
        }
        .onTapGesture {
            onTap?()
        }
        .onChange(of: isRevealed) { _, revealed in
            withAnimation(.spring(duration: 0.8, bounce: 0.2)) {
                rotationAngle = revealed ? 180 : 0
            }
        }
    }
}

struct CardFrontView: View {
    let card: TarotCard
    let orientation: CardOrientation

    var body: some View {
        if let uiImage = CardImageLoader.cachedImage(named: card.imageName) {
            // カスタム画像がある場合のみ逆位置で180°回転（絵柄の反転が正しい表現）
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(7.0 / 10.0, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: TarottoTheme.cardCornerRadius))
                .rotationEffect(orientation == .reversed ? .degrees(180) : .degrees(0))
        } else {
            // プレースホルダーはテキストが読めるよう回転しない
            PlaceholderCardImage(card: card, orientation: orientation)
        }
    }
}

#Preview {
    @Previewable @State var revealed = false

    VStack(spacing: 20) {
        CardFlipView(
            card: .theMagician,
            orientation: .upright,
            isRevealed: revealed
        )
        .frame(width: 100, height: 143)

        Button(revealed ? "裏返す" : "めくる") {
            revealed.toggle()
        }
        .foregroundStyle(TarottoTheme.cardGold)
    }
    .padding()
    .background(TarottoTheme.background)
}
