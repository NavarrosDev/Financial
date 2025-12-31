//
//  EditBudgetView.swift
//  Financial
//
//  Created by Gabriel Navarro on 27/12/25.
//

import SwiftUI

struct EditBudgetView: View {
    @Binding var budget: Double
    @State private var textInput: String = ""

    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Defina seu limite mensal") {
                    HStack {
                        Text("R$")
                        TextField("0.00", text: $textInput)
                            .keyboardType(.decimalPad)
                            .onChange(of: textInput) { oldValue, newValue in
                                textInput = newValue.sanitizedNumeric()
                            }
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
                        if let value = Double(textInput) { budget = value }
                        dismiss()
                    }
                }
            }
            .onAppear {
                textInput = String(format: "%.2f", budget)
                textInput = textInput.replacingOccurrences(of: ".", with: ",")
            }
        }
    }
}

