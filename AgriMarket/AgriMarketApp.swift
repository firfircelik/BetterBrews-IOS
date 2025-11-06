//
//  AgriMarketApp.swift
//  AgriMarket
//
//  Agricultural Commodities Trading Platform
//  Similar to AgFlow, Fastmarkets, and Kpler
//

import SwiftUI

@main
struct AgriMarketApp: App {
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .preferredColorScheme(appState.isDarkMode ? .dark : .light)
        }
    }
}

// MARK: - App State
class AppState: ObservableObject {
    @Published var isDarkMode: Bool = false
    @Published var isAuthenticated: Bool = false
    @Published var selectedCurrency: Currency = .usd
    @Published var favoritecommodities: Set<String> = []
    @Published var priceAlerts: [PriceAlert] = []

    init() {
        loadUserPreferences()
    }

    private func loadUserPreferences() {
        // Load from UserDefaults
        isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        if let currencyCode = UserDefaults.standard.string(forKey: "selectedCurrency"),
           let currency = Currency(rawValue: currencyCode) {
            selectedCurrency = currency
        }
    }

    func savePreferences() {
        UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
        UserDefaults.standard.set(selectedCurrency.rawValue, forKey: "selectedCurrency")
    }
}
