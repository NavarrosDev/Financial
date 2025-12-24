//
//  Expense.swift
//  Financial
//
//  Created by Gabriel Navarro on 22/12/25.
//

import Foundation

struct Expense: Identifiable {
    let id = UUID()
    let title: String
    let amount: Double
    let category: Category
    let date: Date
}
