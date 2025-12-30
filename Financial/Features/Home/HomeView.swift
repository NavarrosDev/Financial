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
                initialCard()
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .navigationTitle("Olá, Gabriel")
            .sheet(isPresented: $showEditBudget) {
                EditBudgetView(budget: $transViewModel.monthlyBudget)
                    .presentationDetents([.fraction(0.3)])
            }
        }
    }
    
    fileprivate func initialCard() -> some View {
        return VStack(spacing: 24) {
            VStack(spacing: 16) {
                Text("Disponível para gastar")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text("R$ \(transViewModel.remainingBudget, specifier: "%.2f")")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundStyle(transViewModel.remainingBudget < 0 ? .red : .primary)
                
                BudgetProgressBar(progress: transViewModel.budgetProgress)
                    .padding(.top, 4)
                
                HStack {
                    Text("Gasto: R$ \(transViewModel.totalSpentThisMonth, specifier: "%.0f")")
                    Spacer()
                    Button { showEditBudget = true }
                        label: {
                            HStack {
                                Text("Meta: R$ \(transViewModel.monthlyBudget, specifier: "%.0f")")
                                Image(systemName: "pencil.circle.fill")
                                    .foregroundStyle(.blue)
                            }
                    }
                    .buttonStyle(.plain)
                }
                .font(.caption)
                .foregroundStyle(.secondary)
            }
            .padding(24)
            .background(Color(uiColor: .systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    HomeView(transViewModel: TransactionViewModel())
}
