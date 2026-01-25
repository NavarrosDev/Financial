//
//  ContentView.swift
//  Financial
//
//  Created by Gabriel Navarro on 24/01/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var transactionViewModel: TransactionViewModel
    @State private var selectedTab: AppTab = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(
                transViewModel: transactionViewModel,
                selectedTab: $selectedTab
            )
            .tabItem {
                Label("Home", systemImage: "house")
            }.tag(AppTab.home)
            TransactionListView(transactionViewModel: transactionViewModel)
                .tabItem {
                    Label("Finanças", systemImage: "list.bullet")
                }.tag(AppTab.transactions)
            DashboardView(viewModel: transactionViewModel)
                .tabItem {
                    Label("DashBoard", systemImage: "graph.2d")
                }.tag(AppTab.dashboard)
        }
    }
}

#Preview {
    ContentView(transactionViewModel: TransactionViewModel())
}
