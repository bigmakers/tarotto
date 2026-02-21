import SwiftUI

struct AIReadingView: View {
    let drawnCards: [DrawnCard]
    let question: String
    let targetPerson: String

    @State private var readingText = ""
    @State private var isLoading = true
    @State private var errorMessage: String?
    @State private var showPremiumAlert = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            TarottoTheme.background.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    VStack(spacing: 8) {
                        if let provider = AISettingsManager.shared.selectedProvider {
                            Label(provider.displayName, systemImage: provider.iconName)
                                .font(.caption)
                                .foregroundStyle(TarottoTheme.textSilver)
                        }

                        Text(L.aiReading)
                            .font(.title2.bold())
                            .foregroundStyle(TarottoTheme.cardGold)
                    }
                    .padding(.top)

                    // Cards summary
                    cardsSummary

                    Divider()
                        .background(TarottoTheme.cardGold.opacity(0.3))
                        .padding(.horizontal)

                    // Reading content
                    if let errorMessage {
                        VStack(spacing: 12) {
                            Image(systemName: "exclamationmark.triangle")
                                .font(.largeTitle)
                                .foregroundStyle(TarottoTheme.reversedRed)
                            Text(errorMessage)
                                .font(.subheadline)
                                .foregroundStyle(TarottoTheme.textSilver)
                                .multilineTextAlignment(.center)
                            Button(L.retry) {
                                self.errorMessage = nil
                                readingText = ""
                                isLoading = true
                                startReading()
                            }
                            .foregroundStyle(TarottoTheme.cardGold)
                        }
                        .padding()
                    } else {
                        Text(readingText)
                            .font(.body)
                            .foregroundStyle(TarottoTheme.starWhite)
                            .lineSpacing(8)
                            .padding(.horizontal)

                        if isLoading {
                            HStack(spacing: 8) {
                                ProgressView()
                                    .tint(TarottoTheme.cardGold)
                                Text(L.readingInProgress)
                                    .font(.subheadline)
                                    .foregroundStyle(TarottoTheme.textSilver)
                            }
                            .padding()
                        }
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .navigationTitle(L.aiReading)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbar {
            if !isLoading && errorMessage == nil && !readingText.isEmpty {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        if PremiumManager.shared.isPremium {
                            PrintService.printReading(
                                question: question,
                                targetPerson: targetPerson,
                                drawnCards: drawnCards,
                                aiReading: readingText
                            )
                        } else {
                            showPremiumAlert = true
                        }
                    } label: {
                        Image(systemName: "printer")
                            .foregroundStyle(TarottoTheme.cardGold)
                    }
                }
            }
        }
        .alert(L.premiumRequired, isPresented: $showPremiumAlert) {
            Button(L.ok) {}
        } message: {
            Text(L.premiumRequiredMessage)
        }
        .task {
            startReading()
        }
    }

    private var cardsSummary: some View {
        VStack(spacing: 8) {
            let sorted = drawnCards.sorted { $0.positionRawValue < $1.positionRawValue }
            ForEach(sorted, id: \.positionRawValue) { card in
                HStack(spacing: 8) {
                    Text("\(card.position.displayNumber).")
                        .font(.subheadline.bold())
                        .foregroundStyle(TarottoTheme.cardGold)
                        .frame(width: 20, alignment: .trailing)
                    Text(card.position.localizedName)
                        .font(.subheadline)
                        .foregroundStyle(TarottoTheme.textSilver)
                        .frame(width: 100, alignment: .leading)
                    Text(card.card.localizedName)
                        .font(.subheadline.bold())
                        .foregroundStyle(TarottoTheme.starWhite)
                    Text(card.orientation.localizedName)
                        .font(.caption)
                        .foregroundStyle(
                            card.orientation == .upright
                                ? TarottoTheme.cardGold
                                : TarottoTheme.reversedRed
                        )
                    Spacer()
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(TarottoTheme.accentPurple.opacity(0.1))
        )
        .padding(.horizontal)
    }

    private func startReading() {
        Task {
            guard let service = AISettingsManager.shared.currentService() else {
                errorMessage = L.aiNotConfigured
                isLoading = false
                return
            }

            do {
                let stream = try await service.generateReading(
                    cards: drawnCards,
                    question: question,
                    targetPerson: targetPerson
                )

                for try await chunk in stream {
                    await MainActor.run {
                        readingText += chunk
                    }
                }

                await MainActor.run {
                    isLoading = false
                }
            } catch {
                await MainActor.run {
                    errorMessage = error.localizedDescription
                    isLoading = false
                }
            }
        }
    }
}
