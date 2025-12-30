//
//  EditBudgetView.swift
//  Financial
//
//  Created by Gabriel Navarro on 27/12/25.
//

import SwiftUI

struct EditBudgetView: View {
    @Binding var budget: Double
    @State private var tempValue: Double = 0.0
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Defina seu limite mensal") {
                    HStack {
                        Text("R$")
                        TextField("0.00", value: $tempValue, format: .number)
                            .keyboardType(.decimalPad)
                    }
                }
            }
            .navigationTitle("Alterar Meta")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        budget = tempValue
                        dismiss()
                    }
                }
            }
            .onAppear {
                tempValue = budget
            }
        }
    }
}

