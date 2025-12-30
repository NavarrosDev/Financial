//
//  Category.swift
//  Financial
//
//  Created by Gabriel Navarro on 23/12/25.
//

enum Category: String, CaseIterable, Identifiable {
    case entry = "Entrada"
    case food = "Alimentação"
    case transport = "Transporte"
    case leisure = "Lazer"
    case accounts = "Contas"
    case others = "Outros"
    
    var id: Self { self }
}
