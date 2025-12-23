//
//  ExpenseListView.swift
//  Financial
//
//  Created by Gabriel Navarro on 22/12/25.
//

import SwiftUI

struct ExpenseListView: View {
    @StateObject private var viewModel = ExpenseViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack(spacing: 8) {
                        Text("Total gasto")
                            .font(.subheadline)
                            .foregroundStyle(Color.secondary)
                        
                        Text("R$ \(viewModel.totalAmount, specifier: "%.2f")")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundStyle(Color.primary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .listRowBackground(Color.clear)
                }
                
                Section("Ultimos lançamentos") {
                    if viewModel.expenses.isEmpty {
                        Text("Nenhum lançamento feito ainda.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(viewModel.expenses) { expense in
                            ExpenseRowView(expense: expense)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Minhas finanças")
            .toolbar {
                NavigationLink("+") {
                    AddExpenseView(viewModel: viewModel)
                }
            }
        }
    }
}

#Preview {
    ExpenseListView()
}
