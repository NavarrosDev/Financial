//
//  RootView.swift
//  Financial
//
//  Created by Gabriel Navarro on 24/12/25.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            TransactionListView()
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
