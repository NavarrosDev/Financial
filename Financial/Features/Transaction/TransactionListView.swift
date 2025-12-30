//
//  ExpenseListView.swift
//  Financial
//
//  Created by Gabriel Navarro on 22/12/25.
//

import SwiftUI

struct TransactionListView: View {
    @ObservedObject var transactionViewModel: TransactionViewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    balances()
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
                
                Section("Ultimos lançamentos") {
                    let transactions = transactionViewModel.sortedTransactions
                    if transactions.isEmpty {
                        Text("Nenhum lançamento feito ainda.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(transactions) { transaction in
                           TransactionRowView(transaction: transaction)
                        }
                        .onDelete { indexSet in
                            transactionViewModel.removeTransaction(at: indexSet, from: transactions)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Minhas finanças")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddTransactionView(transactionViewModel: transactionViewModel)
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(Color.blue.opacity(0.9))
                            .font(.title2)
                    }
                }
                .sharedBackgroundVisibility(.hidden)
            }
        }
    }
    
    fileprivate func balances() -> some View {
        return VStack(spacing: 20) {
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

#Preview {
    TransactionListView(transactionViewModel: TransactionViewModel())
}
