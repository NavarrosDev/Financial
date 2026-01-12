//
//  Expense.swift
//  Financial
//
//  Created by Gabriel Navarro on 22/12/25.
//

import Foundation

enum TransactionType: String, CaseIterable, Identifiable, Codable {
    case income = "Entrada"
    case expense = "Saída"
    
    var id: String { self.rawValue }
}

struct Transaction: Identifiable, Codable {
    let id: UUID
    let title: String
    let amount: Double
    let category: Category
    let transactionType: TransactionType
    let date: Date
}
