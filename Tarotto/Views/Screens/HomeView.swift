import SwiftUI

struct HomeView: View {
    @State private var settings = AppSettings.shared

    var body: some View {
        NavigationStack {
            ZStack {
                MysticalBackground()

                VStack(spacing: 32) {
                    Spacer()

                    // App title
                    VStack(spacing: 8) {
                        Text("Tarotto")
                            .font(.system(size: 52, weight: .thin, design: .serif))
                            .foregroundStyle(TarottoTheme.cardGold)
                            .shadow(color: TarottoTheme.cardGold.opacity(0.4), radius: 20)

                        Text(L.appSubtitle)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(TarottoTheme.starWhite)
                            .tracking(4)
                    }

                    // Mini constellation
                    ConstellationLineView(opacity: 0.4)
                        .frame(width: 200, height: 120)

                    // Welcome message with user name
                    if !settings.userName.isEmpty {
                        Text(settings.isJapanese
                             ? "\(settings.userName)さん、\nおかえりなさい"
                             : "Welcome back,\n\(settings.userName)")
                            .font(.subheadline)
                            .foregroundStyle(TarottoTheme.textSilver)
                            .multilineTextAlignment(.center)
                            .lineSpacing(4)
                    } else {
                        Text(L.homeDescription)
                            .font(.subheadline)
                            .foregroundStyle(TarottoTheme.textSilver)
                            .multilineTextAlignment(.center)
                            .lineSpacing(4)
                    }

                    Spacer()

                    // Start reading button
                    NavigationLink(destination: ReadingSessionView()) {
                        HStack(spacing: 8) {
                            Image(systemName: "sparkles")
                            Text(L.startReading)
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

                    // History
                    NavigationLink(destination: ReadingHistoryView()) {
                        HStack(spacing: 6) {
                            Image(systemName: "book.closed")
                            Text(L.pastReadings)
                        }
                        .font(.subheadline)
                        .foregroundStyle(TarottoTheme.textSilver)
                    }

                    // Settings
                    NavigationLink(destination: SettingsView()) {
                        HStack(spacing: 6) {
                            Image(systemName: "gearshape")
                            Text(L.settings)
                        }
                        .font(.subheadline)
                        .foregroundStyle(TarottoTheme.textSilver.opacity(0.7))
                    }

                    Spacer()
                        .frame(height: 30)
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
