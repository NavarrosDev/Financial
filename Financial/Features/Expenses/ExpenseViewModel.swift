//
//  ExpenseViewModel.swift
//  Financial
//
//  Created by Gabriel Navarro on 22/12/25.
//

import SwiftUI
import Combine

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense]
    
    var totalAmount: Double {
        expenses.reduce(0) { $0 + $1.amount }
    }
    
    init() {
        self.expenses = []
    }
    
    func addExpense(title: String, amount: Double, category: Category) -> Void {
        let newExpense = Expense(
            title: title,
            amount: amount,
            category: category,
            date: Date()
        )
        expenses.append(newExpense)
    }
    
    func removeExpense(at offset: IndexSet) -> Void {
        expenses.remove(atOffsets: offset)
    }
    
    func clearExpenses() -> Void {
        expenses.removeAll()
    }
    
    func colorTotalAmount() -> Color {
        switch totalAmount {
        case 0..<1000:
            return .primary
        case 1000..<2000:
            return .orange
        default:
            return .red
        }
    }
}
