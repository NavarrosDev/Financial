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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                AvaliableToSpendCardView(transViewModel: transViewModel, showEditBudget: $showEditBudget)
                HStack(spacing: 16) {
                    CardValueView(value: transViewModel.totalIncomes, type: .income)
                    CardValueView(value: transViewModel.totalExpenses, type: .expense)
                }
                .padding(.horizontal)
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .navigationTitle("Olá, Gabriel")
            .sheet(isPresented: $showEditBudget) {
                EditBudgetView(budget: $transViewModel.monthlyBudget)
                    .presentationDetents([.fraction(0.3)])
            }
        }
    }
}

#Preview {
    HomeView(transViewModel: TransactionViewModel())
}
