//
//  AddExpenseView.swift
//  Financial
//
//  Created by Gabriel Navarro on 22/12/25.
//

import SwiftUI

struct AddTransactionView: View {
    @ObservedObject var transactionViewModel: TransactionViewModel

    @State private var title = ""
    @State private var amount = ""
    @State private var category: Category = .food
    @State private var transactionType: TransactionType = .expense
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            
            Section {
                Picker("Tipo", selection: $transactionType) {
                    ForEach(TransactionType.allCases) { type in
                        Text(type.rawValue)
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .listRowBackground(Color.clear)
            }
            
            Section("Informações Gerais") {
                HStack {
                    TextField("Descriçao", text: $title)
                        .frame(maxWidth: .infinity)
                    TextField("Valor", text: $amount)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .onChange(of: amount, { oldValue, newValue in
                            amount = newValue.sanitizedNumeric()
                        })
                        .frame(width: 100)
                }
                
                if transactionType == .expense {
                    Picker("Categoria", selection: $category) {
                        ForEach(Category.allCases.filter { $0 != .entry }) { cat in
                            Text(cat.rawValue)
                                .tag(cat)
                        }
                    }
                }
            }
            
            Section {
                Button { saveTransaction() } label: {
                    Text("Confirmar \(transactionType.rawValue)")
                        .frame(maxWidth: .infinity)
                        .bold()
                }
                .disabled(title.isEmpty || amount.isEmpty)
                .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle("Novo Lançamento")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    fileprivate func saveTransaction() {
        if let value = Double(amount) {
            transactionViewModel.addTransaction(
                title: title,
                amount: value,
                category: transactionType == .expense ? category : .entry,
                transactionType: transactionType
            )
            dismiss()
        }
    }
}

#Preview {
    AddTransactionView(transactionViewModel: .init())
}
