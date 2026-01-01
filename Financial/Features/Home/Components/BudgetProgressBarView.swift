//
//  BudgetProgressBar.swift
//  Financial
//
//  Created by Gabriel Navarro on 26/12/25.
//

import SwiftUI

struct BudgetProgressBarView: View {
    var progress: Double
    
    var color: Color {
        if progress >= 1.0 { return .red }
        if progress >= 0.8 { return .orange }
        return .green
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(height: 18)
                    .foregroundStyle(Color.gray.opacity(0.2))
                Capsule()
                    .frame(width: geometry.size.width * progress, height: 18)
                    .foregroundStyle(color)
                    .animation(.spring(), value: progress)
                Text("\(progress * 100, specifier: "%.0f")%")
                    .frame(maxWidth: .infinity)
                    .font(.subheadline)
                    .bold()
            }
        }
        .frame(height: 18)
    }
}

#Preview {
    VStack {
        BudgetProgressBarView(progress: 0.2)
        BudgetProgressBarView(progress: 0.8)
        BudgetProgressBarView(progress: 1.0)
    }
    .padding()
}
