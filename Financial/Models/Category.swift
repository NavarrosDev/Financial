//
//  Category.swift
//  Financial
//
//  Created by Gabriel Navarro on 23/12/25.
//

enum Category: String, CaseIterable, Identifiable {
    case alimentacao = "Alimentação"
    case transporte = "Transporte"
    case lazer = "Lazer"
    case contas = "Contas"
    case outros = "Outros"
    
    var id: Self { self }
}
