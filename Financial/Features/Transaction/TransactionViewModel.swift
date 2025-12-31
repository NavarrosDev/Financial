//
//  ExpenseViewModel.swift
//  Financial
//
//  Created by Gabriel Navarro on 22/12/25.
//

import SwiftUI
import Combine

class TransactionViewModel: ObservableObject {
    @Published var transactions: [Transaction]
    @Published var monthlyBudget: Double
    
    init() {
        self.transactions = []
        self.monthlyBudget = 0.0
    }
    
    // MARK: Usadas no escopo Transaction
    
    var sortedTransactions: [Transaction] {
        transactions.sorted { $0.date > $1.date }
    }
        
    var totalIncomes: Double {
        transactions.filter { $0.transactionType == .income }.reduce(0) { $0 + $1.amount }
    }

    var totalExpenses: Double {
        transactions.filter { $0.transactionType == .expense }.reduce(0) { $0 + $1.amount }
    }

    var totalAmount: Double {
        totalIncomes - totalExpenses
    }
    
    // MARK: Usadas no escopo Home
    
    var expensesThisMonth: [Transaction] {
        let calendar = Calendar.current
        let now = Date()
        
        return transactions.filter { trans in
            let isExpense = trans.transactionType == .expense
            let isSameMonth = calendar.isDate(trans.date, equalTo: now, toGranularity: .month)
            return isExpense && isSameMonth
        }
    }
    
    var totalSpentThisMonth: Double {
        expensesThisMonth.reduce(0) { $0 + $1.amount }
    }
    
    var remainingBudget: Double {
        monthlyBudget - totalSpentThisMonth
    }
    
    var budgetProgress: Double {
        guard monthlyBudget > 0 else { return 0 }
        let progress = totalSpentThisMonth / monthlyBudget
        return min(progress, 1.0)
    }
    
    // MARK: Functions
    
    func addTransaction(title: String, amount: Double, category: Category, transactionType: TransactionType) -> Void {
        let newTransaction = Transaction(
            title: title,
            amount: amount,
            category: category,
            transactionType: transactionType,
            date: Date()
        )
        transactions.append(newTransaction)
    }
        
    func removeTransaction(at offset: IndexSet, from displayedList: [Transaction]) -> Void {
        offset.forEach { index in
            let transactionToDelete = displayedList[index]
            if let originalIndex = transactions.firstIndex(where: { $0.id == transactionToDelete.id }) {
                transactions.remove(at: originalIndex)
            }
        }
    }
    
    static func filterNumericInput(_ input: String) -> String {
        var filtered = input
            .replacingOccurrences(of: ",", with: ".")
            .filter { !"0123456789.".contains($0) }
            
        let component = filtered.split(separator: ".")
        if component.count > 0 { filtered = "\(component[0]).\(component[1])" }
        
        return filtered
    }
}
