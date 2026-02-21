import SwiftUI

struct OnboardingView: View {
    @State private var settings = AppSettings.shared
    @State private var nameInput = ""
    @State private var selectedLanguage: AppSettings.AppLanguage = .japanese
    @State private var showContent = false

    var body: some View {
        ZStack {
            MysticalBackground()

            VStack(spacing: 28) {
                Spacer()

                // Logo
                VStack(spacing: 8) {
                    Text("Tarotto")
                        .font(.system(size: 56, weight: .thin, design: .serif))
                        .foregroundStyle(TarottoTheme.cardGold)
                        .shadow(color: TarottoTheme.cardGold.opacity(0.4), radius: 20)

                    ConstellationLineView(opacity: 0.3)
                        .frame(width: 160, height: 90)
                }
                .opacity(showContent ? 1 : 0)
                .offset(y: showContent ? 0 : -20)

                // Welcome text
                VStack(spacing: 6) {
                    Text(selectedLanguage == .japanese ? "ようこそ" : "Welcome")
                        .font(.title2.bold())
                        .foregroundStyle(TarottoTheme.starWhite)

                    Text(selectedLanguage == .japanese
                         ? "北斗七星の導きで\n気持ちを読み解きましょう"
                         : "Let the Big Dipper guide you\nto read someone's heart")
                        .font(.subheadline)
                        .foregroundStyle(TarottoTheme.textSilver)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                }
                .opacity(showContent ? 1 : 0)

                Spacer()

                // Language selection
                VStack(spacing: 10) {
                    Text(selectedLanguage == .japanese ? "言語を選択" : "Choose Language")
                        .font(.caption)
                        .foregroundStyle(TarottoTheme.textSilver)

                    HStack(spacing: 16) {
                        ForEach(AppSettings.AppLanguage.allCases) { lang in
                            Button {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    selectedLanguage = lang
                                    settings.language = lang
                                }
                            } label: {
                                HStack(spacing: 6) {
                                    Text(lang.flag)
                                        .font(.title3)
                                    Text(lang.displayName)
                                        .font(.subheadline.weight(.medium))
                                }
                                .foregroundStyle(
                                    selectedLanguage == lang
                                        ? TarottoTheme.cardGold
                                        : TarottoTheme.textSilver
                                )
                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(
                                            selectedLanguage == lang
                                                ? TarottoTheme.accentPurple.opacity(0.3)
                                                : TarottoTheme.accentPurple.opacity(0.1)
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(
                                                    selectedLanguage == lang
                                                        ? TarottoTheme.cardGold.opacity(0.6)
                                                        : TarottoTheme.textSilver.opacity(0.2),
                                                    lineWidth: selectedLanguage == lang ? 1.5 : 0.5
                                                )
                                        )
                                )
                            }
                        }
                    }
                }
                .opacity(showContent ? 1 : 0)

                // Name input
                VStack(alignment: .leading, spacing: 6) {
                    Text(selectedLanguage == .japanese ? "あなたの名前" : "Your Name")
                        .font(.caption)
                        .foregroundStyle(TarottoTheme.textSilver)

                    TextField(
                        selectedLanguage == .japanese ? "名前を入力（任意）" : "Enter your name (optional)",
                        text: $nameInput
                    )
                    .textFieldStyle(.plain)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(TarottoTheme.accentPurple.opacity(0.15))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(TarottoTheme.cardGold.opacity(0.3), lineWidth: 0.5)
                            )
                    )
                    .foregroundStyle(TarottoTheme.starWhite)
                }
                .padding(.horizontal, 40)
                .opacity(showContent ? 1 : 0)

                Spacer()

                // Get Started button
                Button(action: completeOnboarding) {
                    HStack(spacing: 8) {
                        Image(systemName: "sparkles")
                        Text(selectedLanguage == .japanese ? "はじめる" : "Get Started")
                    }
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(TarottoTheme.cardGold)
                    .padding(.horizontal, 48)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(TarottoTheme.accentPurple.opacity(0.25))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(TarottoTheme.cardGold.opacity(0.6), lineWidth: 1)
                            )
                    )
                }
                .opacity(showContent ? 1 : 0)

                Spacer()
                    .frame(height: 30)
            }
            .padding()
        }
        .onAppear {
            selectedLanguage = settings.language
            nameInput = settings.userName
            withAnimation(.easeOut(duration: 0.8)) {
                showContent = true
            }
        }
    }

    private func completeOnboarding() {
        settings.userName = nameInput
        settings.language = selectedLanguage
        settings.isOnboardingComplete = true
    }
}

#Preview {
    OnboardingView()
}
