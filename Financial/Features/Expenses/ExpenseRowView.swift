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
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.1))
                    .frame(width: 40, height: 40)
                Image(systemName: "dollarsign")
                    .foregroundStyle(Color.blue)
                    .font(.caption)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(expense.title)
                    .font(.headline)
                
                Text(expense.category.rawValue)
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
            }
            Spacer()
            
            Text("R$ \(expense.amount, specifier: "%.2f")")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primary)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ExpenseRowView(
        expense: Expense(
            title: "Teste",
            amount: 100,
            category: Category.alimentacao,
            date: Date())
    )
}
