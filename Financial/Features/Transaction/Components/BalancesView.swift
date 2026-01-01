//
//  BalancesView.swift
//  Financial
//
//  Created by Gabriel Navarro on 01/01/26.
//

import SwiftUI

struct BalancesView: View {
    @ObservedObject var transactionViewModel: TransactionViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 4) {
                Text("Saldo Disponivel")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text("R$ \(transactionViewModel.totalAmount, specifier: "%.2f")")
                    .font(.system(size: 38, weight: .bold, design: .rounded))
                    .foregroundColor(transactionViewModel.totalAmount >= 0 ? .primary : .red)
            }
            .padding(.top, 10)
            
            HStack {
                VStack(alignment: .leading) {
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.up.circle.fill")
                        Text("Entradas")
                    }
                    .font(.caption)
                    .foregroundColor(.green)
                    
                    Text("R$ \(transactionViewModel.totalIncomes, specifier: "%.2f")")
                        .font(.headline)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    HStack(spacing: 4) {
                        Text("Saídas")
                        Image(systemName: "arrow.down.circle.fill")
                    }
                    .font(.caption)
                    .foregroundColor(.red)
                    
                    Text("R$ \(transactionViewModel.totalExpenses, specifier: "%.2f")")
                        .font(.headline)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity)
    }
}
