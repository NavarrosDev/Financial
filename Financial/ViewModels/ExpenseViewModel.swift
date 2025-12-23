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
    
    init() {
        self.expenses = []
    }
    
    func addExpense(title: String, amount: Double, category: String) {
        let newExpense = Expense(
            title: title,
            amount: amount,
            category: category,
            date: Date()
        )
        expenses.append(newExpense)
    }
    
    var totalAmount: Double {
        expenses.reduce(0) { $0 + $1.amount }
    }
}
