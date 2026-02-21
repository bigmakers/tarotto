import SwiftUI

struct SettingsView: View {
    @State private var aiSettings = AISettingsManager.shared
    @State private var appSettings = AppSettings.shared
    @State private var premiumManager = PremiumManager.shared
    @State private var openAIKey = ""
    @State private var claudeKey = ""
    @State private var geminiKey = ""
    @State private var showKey: [AIProvider: Bool] = [:]
    @State private var testResult: [AIProvider: String] = [:]
    @State private var isTesting: [AIProvider: Bool] = [:]
    @State private var nameInput = ""
    @State private var showResetConfirm = false

    var body: some View {
        ZStack {
            TarottoTheme.background.ignoresSafeArea()

            List {
                // Language selection
                Section {
                    ForEach(AppSettings.AppLanguage.allCases) { lang in
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                appSettings.language = lang
                            }
                        } label: {
                            HStack {
                                Text(lang.flag)
                                    .font(.title3)
                                Text(lang.displayName)
                                    .foregroundStyle(TarottoTheme.starWhite)
                                Spacer()
                                if appSettings.language == lang {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(TarottoTheme.cardGold)
                                }
                            }
                        }
                        .listRowBackground(TarottoTheme.accentPurple.opacity(0.1))
                    }
                } header: {
                    Text(L.languageSection)
                        .foregroundStyle(TarottoTheme.cardGold)
                }

                // User name
                Section {
                    VStack(spacing: 10) {
                        TextField(L.userNamePlaceholder, text: $nameInput)
                            .textFieldStyle(.plain)
                            .foregroundStyle(TarottoTheme.starWhite)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(TarottoTheme.background)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(TarottoTheme.cardGold.opacity(0.2), lineWidth: 0.5)
                                    )
                            )

                        Button {
                            appSettings.userName = nameInput
                        } label: {
                            Text(L.saveBtn)
                                .font(.subheadline.bold())
                                .foregroundStyle(TarottoTheme.background)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .background(RoundedRectangle(cornerRadius: 8).fill(TarottoTheme.cardGold))
                        }
                    }
                    .listRowBackground(TarottoTheme.accentPurple.opacity(0.1))
                } header: {
                    Text(L.userNameSection)
                        .foregroundStyle(TarottoTheme.cardGold)
                }

                // Premium Mode
                Section {
                    if premiumManager.isPremium {
                        HStack {
                            Image(systemName: "crown.fill")
                                .foregroundStyle(TarottoTheme.cardGold)
                            Text(L.premiumActive)
                                .foregroundStyle(TarottoTheme.cardGold)
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.green)
                        }
                        .listRowBackground(TarottoTheme.accentPurple.opacity(0.1))
                    } else {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "crown")
                                    .foregroundStyle(TarottoTheme.cardGold)
                                Text(L.premiumMode)
                                    .font(.subheadline.bold())
                                    .foregroundStyle(TarottoTheme.starWhite)
                            }

                            Text(L.premiumDescription)
                                .font(.caption)
                                .foregroundStyle(TarottoTheme.textSilver)

                            VStack(alignment: .leading, spacing: 4) {
                                Label(L.premiumFeatureAI, systemImage: "brain.head.profile")
                                    .font(.caption)
                                    .foregroundStyle(TarottoTheme.textSilver)
                                Label(L.premiumFeaturePrint, systemImage: "printer")
                                    .font(.caption)
                                    .foregroundStyle(TarottoTheme.textSilver)
                            }

                            Button {
                                Task { await premiumManager.purchase() }
                            } label: {
                                HStack {
                                    Spacer()
                                    if case .purchasing = premiumManager.purchaseState {
                                        ProgressView()
                                            .tint(TarottoTheme.background)
                                    } else {
                                        Text(premiumManager.product?.displayPrice ?? "---")
                                            .font(.headline)
                                        Text("- \(L.purchasePremium)")
                                            .font(.subheadline)
                                    }
                                    Spacer()
                                }
                                .foregroundStyle(TarottoTheme.background)
                                .padding(.vertical, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(TarottoTheme.cardGold)
                                )
                            }
                            .disabled(premiumManager.product == nil)

                            Button {
                                Task { await premiumManager.restorePurchases() }
                            } label: {
                                Text(L.restorePurchases)
                                    .font(.subheadline)
                                    .foregroundStyle(TarottoTheme.textSilver)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(TarottoTheme.textSilver.opacity(0.3), lineWidth: 1)
                                    )
                            }

                            if case .failed(let message) = premiumManager.purchaseState {
                                Text("\(L.purchaseFailed): \(message)")
                                    .font(.caption2)
                                    .foregroundStyle(TarottoTheme.reversedRed)
                            }
                        }
                        .listRowBackground(TarottoTheme.accentPurple.opacity(0.1))
                    }
                } header: {
                    Text(L.premiumMode)
                        .foregroundStyle(TarottoTheme.cardGold)
                }

                // Debug: Premium Toggle (DEBUG builds only)
                #if DEBUG
                Section {
                    Toggle(isOn: Binding(
                        get: { premiumManager.isPremium },
                        set: { premiumManager.isPremium = $0 }
                    )) {
                        HStack {
                            Image(systemName: "ladybug")
                                .foregroundStyle(.orange)
                            Text("Debug: Premium Mode")
                                .foregroundStyle(TarottoTheme.starWhite)
                        }
                    }
                    .tint(TarottoTheme.cardGold)
                    .listRowBackground(TarottoTheme.accentPurple.opacity(0.1))
                } header: {
                    Text("🐛 Debug")
                        .foregroundStyle(.orange)
                }
                #endif

                // AI Provider selection
                Section {
                    ForEach(AIProvider.allCases) { provider in
                        Button {
                            if aiSettings.apiKey(for: provider) != nil {
                                aiSettings.selectedProvider = provider
                            }
                        } label: {
                            HStack {
                                Image(systemName: provider.iconName)
                                    .foregroundStyle(TarottoTheme.cardGold)
                                    .frame(width: 24)
                                Text(provider.displayName)
                                    .foregroundStyle(TarottoTheme.starWhite)
                                Spacer()
                                if aiSettings.selectedProvider == provider {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(TarottoTheme.cardGold)
                                }
                                if aiSettings.apiKey(for: provider) == nil {
                                    Text(L.notConfigured)
                                        .font(.caption)
                                        .foregroundStyle(TarottoTheme.textSilver.opacity(0.5))
                                }
                            }
                        }
                        .listRowBackground(TarottoTheme.accentPurple.opacity(0.1))
                    }

                    Button {
                        aiSettings.selectedProvider = nil
                    } label: {
                        HStack {
                            Image(systemName: "xmark.circle")
                                .foregroundStyle(TarottoTheme.textSilver)
                                .frame(width: 24)
                            Text(L.dontUseAI)
                                .foregroundStyle(TarottoTheme.textSilver)
                            Spacer()
                            if aiSettings.selectedProvider == nil {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(TarottoTheme.cardGold)
                            }
                        }
                    }
                    .listRowBackground(TarottoTheme.accentPurple.opacity(0.1))
                } header: {
                    Text(L.aiProvider)
                        .foregroundStyle(TarottoTheme.cardGold)
                } footer: {
                    Text(L.aiProviderFooter)
                        .foregroundStyle(TarottoTheme.textSilver.opacity(0.6))
                }

                // API Keys
                Section {
                    apiKeyRow(provider: .openAI, key: $openAIKey, placeholder: "sk-...")
                    apiKeyRow(provider: .claude, key: $claudeKey, placeholder: "sk-ant-...")
                    apiKeyRow(provider: .gemini, key: $geminiKey, placeholder: "AIza...")
                } header: {
                    Text(L.apiKeys)
                        .foregroundStyle(TarottoTheme.cardGold)
                } footer: {
                    Text(L.apiKeySaveNote)
                        .foregroundStyle(TarottoTheme.textSilver.opacity(0.6))
                }

                // API Key Instructions
                Section {
                    ForEach(AIProvider.allCases) { provider in
                        DisclosureGroup {
                            Text(instructionsText(for: provider))
                                .font(.caption)
                                .foregroundStyle(TarottoTheme.textSilver)
                                .lineSpacing(4)
                                .padding(.vertical, 4)
                        } label: {
                            HStack {
                                Image(systemName: provider.iconName)
                                    .foregroundStyle(TarottoTheme.cardGold)
                                    .frame(width: 24)
                                Text(provider.displayName)
                                    .foregroundStyle(TarottoTheme.starWhite)
                            }
                        }
                        .tint(TarottoTheme.cardGold)
                        .listRowBackground(TarottoTheme.accentPurple.opacity(0.1))
                    }
                } header: {
                    Text(L.apiKeyInstructions)
                        .foregroundStyle(TarottoTheme.cardGold)
                } footer: {
                    Text(L.apiKeyInstructionsFooter)
                        .foregroundStyle(TarottoTheme.textSilver.opacity(0.6))
                }

                // About
                Section {
                    HStack {
                        Text(L.appNameLabel)
                            .foregroundStyle(TarottoTheme.textSilver)
                        Spacer()
                        Text("Tarotto")
                            .foregroundStyle(TarottoTheme.starWhite)
                    }
                    .listRowBackground(TarottoTheme.accentPurple.opacity(0.1))

                    HStack {
                        Text(L.spreadLabel)
                            .foregroundStyle(TarottoTheme.textSilver)
                        Spacer()
                        Text(L.bigDipperSpread)
                            .foregroundStyle(TarottoTheme.starWhite)
                    }
                    .listRowBackground(TarottoTheme.accentPurple.opacity(0.1))

                    HStack {
                        Text(L.deckLabel)
                            .foregroundStyle(TarottoTheme.textSilver)
                        Spacer()
                        Text(L.fullDeck78)
                            .foregroundStyle(TarottoTheme.starWhite)
                    }
                    .listRowBackground(TarottoTheme.accentPurple.opacity(0.1))
                } header: {
                    Text(L.aboutApp)
                        .foregroundStyle(TarottoTheme.cardGold)
                }

                // Reset All Settings
                Section {
                    Button(role: .destructive) {
                        showResetConfirm = true
                    } label: {
                        HStack {
                            Spacer()
                            Image(systemName: "trash")
                            Text(L.resetAllSettings)
                            Spacer()
                        }
                        .font(.subheadline.bold())
                        .foregroundStyle(.white)
                        .padding(.vertical, 12)
                        .background(RoundedRectangle(cornerRadius: 8).fill(TarottoTheme.reversedRed))
                    }
                    .listRowBackground(TarottoTheme.accentPurple.opacity(0.1))
                }
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle(L.settingsTitle)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .onAppear {
            openAIKey = aiSettings.apiKey(for: .openAI) ?? ""
            claudeKey = aiSettings.apiKey(for: .claude) ?? ""
            geminiKey = aiSettings.apiKey(for: .gemini) ?? ""
            nameInput = appSettings.userName
        }
        .task {
            await premiumManager.loadProducts()
        }
        .alert(L.resetConfirmTitle, isPresented: $showResetConfirm) {
            Button(L.resetBtn, role: .destructive) {
                resetAllSettings()
            }
            Button(L.cancel, role: .cancel) {}
        } message: {
            Text(L.resetConfirmMessage)
        }
    }

    @ViewBuilder
    private func apiKeyRow(provider: AIProvider, key: Binding<String>, placeholder: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: provider.iconName)
                    .foregroundStyle(TarottoTheme.cardGold)
                Text(provider.displayName)
                    .font(.subheadline.bold())
                    .foregroundStyle(TarottoTheme.starWhite)
            }

            HStack {
                if showKey[provider] == true {
                    TextField(placeholder, text: key)
                        .textFieldStyle(.plain)
                        .font(.system(.caption, design: .monospaced))
                        .foregroundStyle(TarottoTheme.starWhite)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                } else {
                    SecureField(placeholder, text: key)
                        .textFieldStyle(.plain)
                        .font(.system(.caption, design: .monospaced))
                        .foregroundStyle(TarottoTheme.starWhite)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }

                Button {
                    showKey[provider] = !(showKey[provider] ?? false)
                } label: {
                    Image(systemName: showKey[provider] == true ? "eye.slash" : "eye")
                        .font(.caption)
                        .foregroundStyle(TarottoTheme.textSilver)
                }
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(TarottoTheme.background)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(TarottoTheme.cardGold.opacity(0.2), lineWidth: 0.5)
                    )
            )

            HStack(spacing: 10) {
                Button {
                    aiSettings.setAPIKey(key.wrappedValue.isEmpty ? nil : key.wrappedValue, for: provider)
                    if aiSettings.selectedProvider == nil && !key.wrappedValue.isEmpty {
                        aiSettings.selectedProvider = provider
                    }
                } label: {
                    Text(L.saveBtn)
                        .font(.subheadline.bold())
                        .foregroundStyle(TarottoTheme.background)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(RoundedRectangle(cornerRadius: 8).fill(TarottoTheme.cardGold))
                }

                if aiSettings.apiKey(for: provider) != nil {
                    Button {
                        aiSettings.removeAPIKey(for: provider)
                        key.wrappedValue = ""
                        testResult[provider] = nil
                    } label: {
                        Text(L.deleteBtn)
                            .font(.subheadline.bold())
                            .foregroundStyle(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(RoundedRectangle(cornerRadius: 8).fill(TarottoTheme.reversedRed))
                    }
                }

                Spacer()

                if let result = testResult[provider] {
                    Text(result)
                        .font(.caption2)
                        .foregroundStyle(
                            result.contains("成功") || result.contains("Success")
                                ? .green : TarottoTheme.reversedRed
                        )
                }
            }
        }
        .padding(.vertical, 4)
        .listRowBackground(TarottoTheme.accentPurple.opacity(0.1))
    }

    private func instructionsText(for provider: AIProvider) -> String {
        switch provider {
        case .openAI: return L.openAIInstructions
        case .claude: return L.claudeInstructions
        case .gemini: return L.geminiInstructions
        }
    }

    private func resetAllSettings() {
        // Clear all UserDefaults tarotto_ keys
        let keys = [
            "tarotto_language",
            "tarotto_user_name",
            "tarotto_onboarding_complete",
            "tarotto_is_premium",
            "tarotto_selected_ai_provider"
        ]
        for key in keys {
            UserDefaults.standard.removeObject(forKey: key)
        }

        // Remove all API keys from Keychain
        for provider in AIProvider.allCases {
            aiSettings.removeAPIKey(for: provider)
        }
        aiSettings.selectedProvider = nil

        // Reset local state
        openAIKey = ""
        claudeKey = ""
        geminiKey = ""
        nameInput = ""

        // Return to onboarding
        appSettings.isOnboardingComplete = false
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
