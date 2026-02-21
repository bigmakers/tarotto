import SwiftUI
import SwiftData

struct ReadingSessionView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    enum Phase: Equatable {
        case questionInput
        case shuffling
        case drawing
        case spreading
        case revealing
        case complete
    }

    @State private var phase: Phase = .questionInput
    @State private var question = ""
    @State private var targetPerson = ""
    @State private var drawnCards: [DrawnCard] = []
    @State private var revealedPositions: Set<Int> = []
    @State private var selectedCardIndex: Int?
    @State private var showSaveConfirmation = false
    @State private var layoutProgress: CGFloat = 0
    @State private var showPremiumAlert = false

    private let deckService = DeckShuffleService()

    var body: some View {
        ZStack {
            MysticalBackground()

            switch phase {
            case .questionInput:
                questionInputView
            case .shuffling:
                ShuffleAnimationView(onComplete: startDrawing)
            case .drawing:
                DrawingAnimationView(onComplete: startSpreading)
            case .spreading, .revealing, .complete:
                spreadView
            }
        }
        .navigationBarBackButtonHidden(phase != .questionInput)
        .toolbar {
            if phase != .questionInput {
                ToolbarItem(placement: .topBarLeading) {
                    if phase == .complete {
                        Button(L.back) { dismiss() }
                            .foregroundStyle(TarottoTheme.textSilver)
                    }
                }
            }
            if phase == .complete {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        Button {
                            if PremiumManager.shared.isPremium {
                                PrintService.printReading(
                                    question: question,
                                    targetPerson: targetPerson,
                                    drawnCards: drawnCards
                                )
                            } else {
                                showPremiumAlert = true
                            }
                        } label: {
                            Image(systemName: "printer")
                        }
                        .foregroundStyle(TarottoTheme.textSilver)

                        Button(L.save) { saveReading() }
                            .foregroundStyle(TarottoTheme.cardGold)
                    }
                }
            }
        }
        .alert(L.saved, isPresented: $showSaveConfirmation) {
            Button(L.ok) { dismiss() }
        }
        .alert(L.premiumRequired, isPresented: $showPremiumAlert) {
            Button(L.ok) {}
        } message: {
            Text(L.premiumRequiredMessage)
        }
        .sheet(item: $selectedCardIndex) { index in
            if index < drawnCards.count {
                CardDetailView(drawnCard: drawnCards[index])
            }
        }
    }

    // MARK: - Question Input

    private var questionInputView: some View {
        VStack(spacing: 24) {
            Spacer()

            VStack(spacing: 8) {
                Image(systemName: "sparkles")
                    .font(.largeTitle)
                    .foregroundStyle(TarottoTheme.cardGold)
                Text(L.bigDipperSpread)
                    .font(.title2)
                    .foregroundStyle(TarottoTheme.starWhite)
            }

            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(L.targetPersonLabel)
                        .font(.caption)
                        .foregroundStyle(TarottoTheme.textSilver)
                    TextField(L.targetPersonPlaceholder, text: $targetPerson)
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

                VStack(alignment: .leading, spacing: 6) {
                    Text(L.questionLabel)
                        .font(.caption)
                        .foregroundStyle(TarottoTheme.textSilver)
                    TextField(L.questionPlaceholder, text: $question, axis: .vertical)
                        .textFieldStyle(.plain)
                        .lineLimit(3...5)
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
            }
            .padding(.horizontal, 24)

            Text(L.guidanceBeforeDraw)
                .font(.caption)
                .foregroundStyle(TarottoTheme.textSilver.opacity(0.7))
                .multilineTextAlignment(.center)

            Button(action: startShuffle) {
                HStack(spacing: 8) {
                    Image(systemName: "suit.spade.fill")
                    Text(L.drawCards)
                }
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(TarottoTheme.cardGold)
                .padding(.horizontal, 40)
                .padding(.vertical, 14)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(TarottoTheme.accentPurple.opacity(0.25))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(TarottoTheme.cardGold.opacity(0.6), lineWidth: 1)
                        )
                )
            }
            .disabled(question.isEmpty || targetPerson.isEmpty)
            .opacity(question.isEmpty || targetPerson.isEmpty ? 0.4 : 1.0)

            Spacer()
        }
    }

    // MARK: - Spread View

    private var spreadView: some View {
        VStack(spacing: 8) {
            // Header
            if phase == .revealing {
                VStack(spacing: 4) {
                    Text(L.tapToReveal)
                        .font(.subheadline)
                        .foregroundStyle(TarottoTheme.textSilver)
                    if AISettingsManager.shared.hasConfiguredProvider {
                        Text(L.aiGuidanceText)
                            .font(.caption)
                            .foregroundStyle(TarottoTheme.cardGold.opacity(0.7))
                    }
                }
                .padding(.top, 8)
            } else if phase == .complete {
                Text(L.allCardsRevealed)
                    .font(.subheadline)
                    .foregroundStyle(TarottoTheme.cardGold)
                    .padding(.top, 8)
            }

            ZStack {
                ConstellationLineView(opacity: 0.2)

                BigDipperLayoutAnimatable(animationProgress: layoutProgress) {
                    ForEach(0..<drawnCards.count, id: \.self) { index in
                        VStack(spacing: 3) {
                            CardFlipView(
                                card: drawnCards[index].card,
                                orientation: drawnCards[index].orientation,
                                isRevealed: revealedPositions.contains(index),
                                onTap: { revealCard(at: index) }
                            )
                            .frame(width: TarottoTheme.cardWidth, height: TarottoTheme.cardHeight)
                            .glow(
                                revealedPositions.contains(index)
                                    ? TarottoTheme.cardGold
                                    : TarottoTheme.accentPurple,
                                radius: 6,
                                isActive: true
                            )

                            if layoutProgress > 0.8 {
                                if let position = SpreadPosition(rawValue: index) {
                                    Text(L.positionNameCompact(position))
                                        .font(.system(size: 11, weight: .medium))
                                        .foregroundStyle(TarottoTheme.textSilver.opacity(0.8))
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .transition(.opacity)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 8)

            // AI Reading button (shown when complete and AI is configured)
            if phase == .complete {
                if AISettingsManager.shared.hasConfiguredProvider {
                    if PremiumManager.shared.isPremium {
                        NavigationLink(destination: AIReadingView(
                            drawnCards: drawnCards,
                            question: question,
                            targetPerson: targetPerson
                        )) {
                            HStack(spacing: 6) {
                                Image(systemName: "brain.head.profile")
                                Text(L.viewAIReading)
                            }
                            .font(.subheadline)
                            .foregroundStyle(TarottoTheme.cardGold)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(TarottoTheme.accentPurple.opacity(0.2))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(TarottoTheme.cardGold.opacity(0.4), lineWidth: 0.5)
                                    )
                            )
                        }
                    } else {
                        Button {
                            showPremiumAlert = true
                        } label: {
                            HStack(spacing: 6) {
                                Image(systemName: "lock.fill")
                                Text(L.viewAIReading)
                            }
                            .font(.subheadline)
                            .foregroundStyle(TarottoTheme.textSilver)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(TarottoTheme.accentPurple.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(TarottoTheme.textSilver.opacity(0.3), lineWidth: 0.5)
                                    )
                            )
                        }
                    }
                }

                Text(L.tapCardForDetail)
                    .font(.caption)
                    .foregroundStyle(TarottoTheme.textSilver.opacity(0.6))
                    .padding(.bottom, 8)
            }
        }
    }

    // MARK: - Actions

    private func startShuffle() {
        drawnCards = deckService.performReading()
        withAnimation(.easeInOut(duration: 0.3)) {
            phase = .shuffling
        }
    }

    private func startDrawing() {
        withAnimation { phase = .drawing }
    }

    private func startSpreading() {
        phase = .spreading
        withAnimation(.easeInOut(duration: 1.5)) {
            layoutProgress = 1.0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            withAnimation { phase = .revealing }
        }
    }

    private func revealCard(at index: Int) {
        if phase == .revealing || phase == .complete {
            if revealedPositions.contains(index) {
                // Already revealed — show detail
                selectedCardIndex = index
            } else {
                let _ = withAnimation(.spring(duration: 0.6)) {
                    revealedPositions.insert(index)
                }
                if revealedPositions.count == 7 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation { phase = .complete }
                    }
                }
            }
        }
    }

    private func saveReading() {
        let reading = Reading(
            question: question,
            targetPerson: targetPerson,
            drawnCards: drawnCards
        )
        modelContext.insert(reading)
        showSaveConfirmation = true
    }
}

extension Int: @retroactive Identifiable {
    public var id: Int { self }
}

#Preview {
    NavigationStack {
        ReadingSessionView()
    }
    .modelContainer(for: [Reading.self, DrawnCard.self])
}
