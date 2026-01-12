//
//  sumaryCardButtonView.swift
//  Financial
//
//  Created by Gabriel Navarro on 03/01/26.
//

import SwiftUI

struct SumaryCardButtonView: View {
    var value: Double
    var type: TransactionType
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            CardValueView(value: value, type: type)
        }
        .buttonStyle(.plain)
    }
}
