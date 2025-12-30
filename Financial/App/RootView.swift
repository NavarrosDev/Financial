//
//  RootView.swift
//  Financial
//
//  Created by Gabriel Navarro on 24/12/25.
//

import SwiftUI

struct RootView: View {
    @StateObject var transactionViewModel = TransactionViewModel()
    
    var body: some View {
        TabView {
            HomeView(transViewModel: transactionViewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            TransactionListView(transactionViewModel: transactionViewModel)
                .tabItem {
                    Label("Finanças", systemImage: "list.bullet")
                }
            DashboardView()
                .tabItem {
                    Label("DashBoard", systemImage: "graph.2d")
                }
        }
    }
}

#Preview {
    RootView()
}
