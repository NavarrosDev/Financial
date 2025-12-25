//
//  ExpenseRowView.swift
//  Financial
//
//  Created by Gabriel Navarro on 22/12/25.
//

import SwiftUI

struct TransactionRowView: View {
    var transaction: Transaction
    
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
                Text(transaction.title)
                    .font(.headline)
                
                Text(transaction.category.rawValue)
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
            }
            Spacer()
            
            Text("R$ \(transaction.amount, specifier: "%.2f")")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primary)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    TransactionRowView(
        transaction: Transaction(
            title: "Teste",
            amount: 100,
            category: Category.alimentacao,
            transactionType: .expense,
            date: Date())
    )
}
