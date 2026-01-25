//
//  OnboardingView.swift
//  Financial
//
//  Created by Gabriel Navarro on 24/01/26.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: TransactionViewModel
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
    
    @State private var userName: String = ""
    @State private var monthlyLimit: String = ""
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            VStack(spacing: 16) {
                Text("Bem-vindo ao seu\ncontrole financeiro!")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Como podemos te chamar?")
                        .font(.headline)
                    TextField("Seu nome", text: $userName)
                        .padding()
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(10)
                }
                
                VStack(alignment: .leading) {
                    Text("Qual sua meta de gasto mensal?")
                        .font(.headline)
                    TextField("R$ 0,00", text: $monthlyLimit)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 35)
            
            Spacer()
            
            Button {
                saveAndExit()
            } label: {
                Text("Bora lá!")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(userName.isEmpty ? Color.gray : Color.blue)
                    .cornerRadius(15)
            }
            .disabled(userName.isEmpty)
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
    
    private func saveAndExit() {
        if let limit = Double(monthlyLimit) {
            viewModel.userName = userName
            viewModel.monthlyBudget = limit
        }
        
        withAnimation {
            hasCompletedOnboarding = true
        }
    }
}

#Preview {
    OnboardingView(viewModel: TransactionViewModel())
}
