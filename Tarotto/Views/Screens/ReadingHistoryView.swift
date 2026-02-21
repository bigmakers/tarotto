import SwiftUI
import SwiftData

struct ReadingHistoryView: View {
    @Query(sort: \Reading.createdAt, order: .reverse) private var readings: [Reading]
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ZStack {
            TarottoTheme.background.ignoresSafeArea()

            if readings.isEmpty {
                ContentUnavailableView {
                    Label(L.noReadingsYet, systemImage: "sparkles")
                        .foregroundStyle(TarottoTheme.textSilver)
                } description: {
                    Text(L.readingsWillAppear)
                        .foregroundStyle(TarottoTheme.textSilver.opacity(0.6))
                }
            } else {
                List {
                    ForEach(readings) { reading in
                        NavigationLink(destination: SavedReadingDetailView(reading: reading)) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(reading.question)
                                    .font(.headline)
                                    .foregroundStyle(TarottoTheme.starWhite)
                                    .lineLimit(2)

                                HStack {
                                    Image(systemName: "person.fill")
                                        .font(.caption2)
                                    Text(reading.targetPerson)
                                        .font(.subheadline)
                                }
                                .foregroundStyle(TarottoTheme.textSilver)

                                Text(reading.createdAt, style: .date)
                                    .font(.caption)
                                    .foregroundStyle(TarottoTheme.textSilver.opacity(0.6))
                            }
                            .padding(.vertical, 4)
                        }
                        .listRowBackground(TarottoTheme.accentPurple.opacity(0.1))
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            modelContext.delete(readings[index])
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
        .navigationTitle(L.readingHistory)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

struct SavedReadingDetailView: View {
    let reading: Reading
    @State private var selectedCardIndex: Int?
    @State private var showPremiumAlert = false

    private var sortedCards: [DrawnCard] {
        reading.drawnCards.sorted { $0.positionRawValue < $1.positionRawValue }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Reading info
                VStack(spacing: 8) {
                    Text(reading.question)
                        .font(.headline)
                        .foregroundStyle(TarottoTheme.starWhite)
                        .multilineTextAlignment(.center)

                    HStack {
                        Image(systemName: "person.fill")
                        Text(reading.targetPerson)
                    }
                    .font(.subheadline)
                    .foregroundStyle(TarottoTheme.textSilver)

                    Text(reading.createdAt, format: .dateTime.year().month().day().hour().minute())
                        .font(.caption)
                        .foregroundStyle(TarottoTheme.textSilver.opacity(0.6))
                }
                .padding()

                // Cards in constellation layout
                ZStack {
                    ConstellationLineView(opacity: 0.2)

                    BigDipperLayout(animationProgress: 1.0) {
                        ForEach(0..<sortedCards.count, id: \.self) { index in
                            VStack(spacing: 3) {
                                CardFrontView(
                                    card: sortedCards[index].card,
                                    orientation: sortedCards[index].orientation
                                )
                                .frame(width: TarottoTheme.cardWidth, height: TarottoTheme.cardHeight)
                                .glow(TarottoTheme.cardGold, radius: 4)
                                .onTapGesture {
                                    selectedCardIndex = index
                                }

                                Text(L.positionNameCompact(sortedCards[index].position))
                                    .font(.system(size: 7))
                                    .foregroundStyle(TarottoTheme.textSilver.opacity(0.8))
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                            }
                        }
                    }
                }
                .frame(height: 420)
                .padding(.horizontal, 8)

                // Card list
                VStack(spacing: 12) {
                    ForEach(sortedCards, id: \.positionRawValue) { card in
                        HStack(spacing: 12) {
                            Text("\(card.position.displayNumber)")
                                .font(.system(size: 14, weight: .bold, design: .serif))
                                .foregroundStyle(TarottoTheme.cardGold)
                                .frame(width: 20)

                            VStack(alignment: .leading, spacing: 2) {
                                Text(card.position.localizedName)
                                    .font(.caption)
                                    .foregroundStyle(TarottoTheme.textSilver)
                                HStack(spacing: 4) {
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
                                }
                            }

                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()

                // AI Reading if saved
                if let aiReading = reading.aiReading, !aiReading.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Label(L.aiReading, systemImage: "brain.head.profile")
                            .font(.headline)
                            .foregroundStyle(TarottoTheme.cardGold)

                        Text(aiReading)
                            .font(.body)
                            .foregroundStyle(TarottoTheme.starWhite)
                            .lineSpacing(6)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(TarottoTheme.accentPurple.opacity(0.1))
                    )
                    .padding(.horizontal)
                }
            }
            .padding(.bottom, 30)
        }
        .background(TarottoTheme.background)
        .navigationTitle(L.readingDetail)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    if PremiumManager.shared.isPremium {
                        PrintService.printReading(
                            question: reading.question,
                            targetPerson: reading.targetPerson,
                            drawnCards: reading.drawnCards,
                            aiReading: reading.aiReading,
                            date: reading.createdAt
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
        .alert(L.premiumRequired, isPresented: $showPremiumAlert) {
            Button(L.ok) {}
        } message: {
            Text(L.premiumRequiredMessage)
        }
        .sheet(item: $selectedCardIndex) { index in
            if index < sortedCards.count {
                CardDetailView(drawnCard: sortedCards[index])
            }
        }
    }
}
