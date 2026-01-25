//
//  RootView.swift
//  Financial
//
//  Created by Gabriel Navarro on 24/12/25.
//

import SwiftUI

struct RootView: View {
    @StateObject var transactionViewModel = TransactionViewModel()
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
    RootView()
}
