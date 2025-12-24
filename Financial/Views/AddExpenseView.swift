//
//  AddExpenseView.swift
//  Financial
//
//  Created by Gabriel Navarro on 22/12/25.
//

import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var viewModel: ExpenseViewModel

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
                    
            Button {
                if let value = Double(amount) {
                    viewModel.addExpense(title: title, amount: value, category: category)
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
    AddExpenseView(viewModel: .init())
}
