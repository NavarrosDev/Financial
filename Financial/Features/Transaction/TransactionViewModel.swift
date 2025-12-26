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
    
    var totalIncomes: Double {
        transactions.filter { $0.transactionType == .income }.reduce(0) { $0 + $1.amount }
    }

    var totalExpenses: Double {
        transactions.filter { $0.transactionType == .expense }.reduce(0) { $0 + $1.amount }
    }

    var totalAmount: Double {
        totalIncomes - totalExpenses
    }
    
    init() {
        self.transactions = []
    }
    
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
    
    func removeTransaction(at offset: IndexSet) -> Void {
        transactions.remove(atOffsets: offset)
    }
}
