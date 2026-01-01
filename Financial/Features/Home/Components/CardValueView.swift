//
//  cardValue.swift
//  Financial
//
//  Created by Gabriel Navarro on 31/12/25.
//

import SwiftUI

struct CardValueView: View {
    var value: Double
    var type: TransactionType
    
    var body: some View {
        VStack(spacing: 15) {
            Text(type == .income ? "Entradas" : "Saídas")
                .font(.title)
                .foregroundStyle(type == .income ? .green : .red)
                .bold()
                .padding(.top, 10)
          
            Text("R$\(type == .income ? "" : "-")\(value, specifier: "%.2f")")
                .font(.title2)
                .padding(.bottom, 10)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(Color(uiColor: .systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    CardValueView(value: 2666.66, type: .expense)
}
