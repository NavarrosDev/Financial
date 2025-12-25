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
    @State private var category: Category = .alimentacao
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField("Descriçao", text: $title)
            TextField("Valor", text: $amount)
                .keyboardType(.decimalPad)
            
            Picker("Categoria", selection: $category) {
                ForEach(Category.allCases) { cat in
                    Text(cat.rawValue)
                        .tag(cat)
                }
            }
            
            // Picker para transactiontype
                    
            Button {
                if let value = Double(amount) {
                    transactionViewModel.addTransaction(title: title, amount: value, category: category, transactionType: .expense)
                    dismiss()
                }
            } label: {
                Text("Salvar")
            }
            .disabled(title.isEmpty || amount.isEmpty)
            .frame(maxWidth: .infinity)
            
        }
    }
}

#Preview {
    AddTransactionView(transactionViewModel: .init())
}
