//
//  avaliableToSpendCard.swift
//  Financial
//
//  Created by Gabriel Navarro on 01/01/26.
//

import SwiftUI

struct AvaliableToSpendCardView: View {
    @ObservedObject var transViewModel: TransactionViewModel
    @Binding var showEditBudget: Bool
    
    var remainingBudget: Double {
        if transViewModel.remainingBudget < 0 { return 0 }
        return transViewModel.remainingBudget
    }
    
    var body: some View {
        Button {
            showEditBudget = true
        } label: {
            VStack(spacing: 24) {
                VStack(spacing: 16) {
                    Text("Restante com base no limite")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Text("R$ \(remainingBudget, specifier: "%.2f")")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                    
                    BudgetProgressBarView(progress: transViewModel.budgetProgress)
                        .padding(.top, 4)
                    
                    HStack {
                        Text("Gasto: R$ \(transViewModel.totalSpentThisMonth, specifier: "%.2f")")
                        Spacer()
                        Text("Limite: R$ \(transViewModel.monthlyBudget, specifier: "%.2f")")
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
        .buttonStyle(.plain)
    }
}

#Preview {
    AvaliableToSpendCardView(transViewModel: TransactionViewModel(), showEditBudget: .constant(false))
}
