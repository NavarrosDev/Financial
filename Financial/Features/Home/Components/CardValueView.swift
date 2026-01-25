//
//  cardValue.swift
//  Financial
//
//  Created by Gabriel Navarro on 31/12/25.
//

import SwiftUI

struct CardValueView: View {
    var title: String
    var value: Double
    var type: TransactionType
    
    var body: some View {
        VStack(spacing: 15) {
            Text(title)
                .font(.title)
                .foregroundStyle(colorTitle)
                .bold()
                .padding(.top, 10)
          
            Text("R$\(type == .expense && value != 0 ? "-" : "")\(value, specifier: "%.2f")")
                .font(.title2)
                .padding(.bottom, 10)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
    
    var colorTitle: Color {
        if title.contains("Total") {
            return .primary
        }
        return type == .income ? .green : .red
    }
}

#Preview {
    CardValueView(title: "Valor Total", value: 2666.66, type: .expense)
}
