//
//  ExpenseListView.swift
//  Financial
//
//  Created by Gabriel Navarro on 22/12/25.
//

import SwiftUI

struct TransactionListView: View {
    @StateObject private var transactionViewModel = TransactionViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack(spacing: 8) {
                        Text("Total gasto")
                            .font(.subheadline)
                            .foregroundStyle(Color.secondary)
                        
                        Text("R$ \(transactionViewModel.totalAmount, specifier: "%.2f")")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundStyle(transactionViewModel.colorTotalAmount())
                    }
                    .frame(maxWidth: .infinity)
                    .padding(20)
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
                
                Section("Ultimos lançamentos") {
                    if transactionViewModel.transaction.isEmpty {
                        Text("Nenhum lançamento feito ainda.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(transactionViewModel.transaction) { transaction in
                            AddTransactionView(transactionViewModel: transactionViewModel)
                        }
                        .onDelete(perform: transactionViewModel.removeTransaction)
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
    TransactionListView()
}
