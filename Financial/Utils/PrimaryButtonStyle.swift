//
//  PrimaryButtonStyle.swift
//  Financial
//
//  Created by Gabriel Navarro on 06/01/26.
//

import SwiftUI


struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .bold()
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.1))
                    .shadow(
                        color: Color.black.opacity(configuration.isPressed ? 0.05 : 0.15),
                        radius: 10, x: 0, y: 5
                    )
                
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
    }
}
