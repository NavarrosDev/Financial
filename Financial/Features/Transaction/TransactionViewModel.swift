//
//  ExpenseViewModel.swift
//  Financial
//
//  Created by Gabriel Navarro on 22/12/25.
//

import SwiftUI
import Combine

class TransactionViewModel: ObservableObject {
    @Published var transaction: [Transaction]
    
    var totalAmount: Double {
        transaction.reduce(0) { $0 + $1.amount }
    }
    
    init() {
        self.transaction = []
    }
    
    func addTransaction(title: String, amount: Double, category: Category, transactionType: TransactionType) -> Void {
        let newTransaction = Transaction(
            title: title,
            amount: amount,
            category: category,
            transactionType: transactionType,
            date: Date()
        )
        transaction.append(newTransaction)
    }
    
    func removeTransaction(at offset: IndexSet) -> Void {
        transaction.remove(atOffsets: offset)
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
