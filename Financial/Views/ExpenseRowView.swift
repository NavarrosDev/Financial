//
//  ExpenseRowView.swift
//  Financial
//
//  Created by Gabriel Navarro on 22/12/25.
//

import SwiftUI

struct ExpenseRowView: View {
    var expense: Expense
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(expense.title)
                    .font(.headline)
                
                Text(expense.category)
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
            }
            Spacer()
            
            Text("R$ \(expense.amount, specifier: "%.2f")")
                .fontWeight(.semibold)
                .foregroundStyle(expense.amount > 100 ? Color.orange : Color.primary)
        }
        .padding()
    }
}

#Preview {
    ExpenseRowView(
        expense: Expense(
            title: "Teste",
            amount: 100,
            category: "Alimentação",
            date: Date())
    )
}
