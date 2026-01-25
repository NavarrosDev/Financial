//
//  HomeView.swift
//  Financial
//
//  Created by Gabriel Navarro on 24/12/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var transViewModel: TransactionViewModel
    @State private var showEditBudget = false
    @Binding var selectedTab: AppTab
    
    var body: some View {
        NavigationStack {
            ScrollView {
                SumaryCardButtonView(title: "Valor Total", value: transViewModel.totalAmount, type: .income) { }
                    .padding(.horizontal)
                
                AvaliableToSpendCardView(transViewModel: transViewModel, showEditBudget: $showEditBudget)
                HStack(spacing: 16) {
                    SumaryCardButtonView(title: "Entradas", value: transViewModel.totalIncomes, type: .income) {
                        selectedTab = .transactions
                        transViewModel.activeFilter = Set([.entry])
                    }
                    SumaryCardButtonView(title: "Saídas", value: transViewModel.totalExpenses, type: .expense) {
                        selectedTab = .transactions
                        transViewModel.activeFilter = Set(Filter.allCases.filter { $0 != .entry })
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top, 30)
            .background(Color(uiColor: .systemGroupedBackground))
            .navigationTitle("Olá, \(transViewModel.userName)")
            .sheet(isPresented: $showEditBudget) {
                EditBudgetView(budget: $transViewModel.monthlyBudget)
                    .presentationDetents([.fraction(0.3)])
            }
        }
    }
}

#Preview {
    HomeView(transViewModel: TransactionViewModel(), selectedTab: .constant(.home))
}

