//
//  ExpenseListView.swift
//  Financial
//
//  Created by Gabriel Navarro on 22/12/25.
//

import SwiftUI

struct ExpenseListView: View {
    @StateObject private var viewModel = ExpenseViewModel()
    @State private var showingDeleteAlert = false
    
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
                            .foregroundStyle(viewModel.colorTotalAmount())
                    }
                    .frame(maxWidth: .infinity)
                    .padding(20)
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
                
                Section("Ultimos lançamentos") {
                    if viewModel.expenses.isEmpty {
                        Text("Nenhum lançamento feito ainda.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(viewModel.expenses) { expense in
                            ExpenseRowView(expense: expense)
                        }
                        .onDelete(perform: viewModel.removeExpense)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Minhas finanças")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddExpenseView(viewModel: viewModel)
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(Color.blue.opacity(0.9))
                            .font(.title2)
                    }
                }
                .sharedBackgroundVisibility(.hidden)
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(role: .destructive) {
                        showingDeleteAlert = true
                    } label: {
                        Image(systemName: "trash")
                            .foregroundStyle(viewModel.expenses.isEmpty ? .gray.opacity(0.3) : .red)
                    }
                    .disabled(viewModel.expenses.isEmpty)
                }
                .sharedBackgroundVisibility(.hidden)
            }
            .alert("Apagar tudo?", isPresented: $showingDeleteAlert) {
                Button("Cancelar", role: .cancel) { }
                Button("Apagar", role: .destructive) {
                    viewModel.clearExpenses()
                }
            } message: {
                Text("Essa ação não pode ser desfeita.")
            }
        }
    }
}

#Preview {
    ExpenseListView()
}
