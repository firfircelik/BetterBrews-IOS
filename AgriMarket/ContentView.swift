//
//  ContentView.swift
//  AgriMarket
//
//  Main navigation container
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "chart.line.uptrend.xyaxis")
                }
                .tag(0)

            MarketsView()
                .tabItem {
                    Label("Markets", systemImage: "globe.americas.fill")
                }
                .tag(1)

            CommoditiesView()
                .tabItem {
                    Label("Commodities", systemImage: "leaf.fill")
                }
                .tag(2)

            NewsView()
                .tabItem {
                    Label("News", systemImage: "newspaper.fill")
                }
                .tag(3)

            AnalyticsView()
                .tabItem {
                    Label("Analytics", systemImage: "chart.bar.fill")
                }
                .tag(4)
        }
        .accentColor(.green)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
}
