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
                    BalancesView(transactionViewModel: transactionViewModel)
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
}

#Preview {
    TransactionListView(transactionViewModel: TransactionViewModel())
}
