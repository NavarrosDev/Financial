//
//  Filter.swift
//  Financial
//
//  Created by Gabriel Navarro on 05/01/26.
//

enum Filter: String, CaseIterable, Identifiable {
    case entry = "Entrada"
    case food = "Alimentação"
    case transport = "Transporte"
    case leisure = "Lazer"
    case accounts = "Contas"
    case others = "Outros"
    
    var id: Self { self }
}
