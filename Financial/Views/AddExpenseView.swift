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
    @State private var category = "Alimentação"
    
    @Environment(\.dismiss) var dismiss
    
    let categories = ["Alimentação", "Transporte", "Lazer", "Contas", "Outros"]
    
    var body: some View {
        Form {
            TextField("Descriçao", text: $title)
            TextField("Valor", text: $amount)
                .keyboardType(.decimalPad)
            
            Picker("Categoria", selection: $category) {
                ForEach(categories, id: \.self) { cat in
                    Text(cat)
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

//
//            
//            Button("Salvar") {
//                if let value = Double(amount) {
//                    viewModel.addExpense(title: title, amount: value, category: category)
//                    dismiss()
//                }
//            }
//            .disabled(title.isEmpty || amount.isEmpty)
        }
}

#Preview {
    AddExpenseView(viewModel: .init())
}
