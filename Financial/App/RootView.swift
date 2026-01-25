//
//  RootView.swift
//  Financial
//
//  Created by Gabriel Navarro on 24/12/25.
//

import SwiftUI

struct RootView: View {
    @StateObject var transactionViewModel = TransactionViewModel()
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
    
    var body: some View {
        if hasCompletedOnboarding {
            ContentView(transactionViewModel: transactionViewModel)
        } else {
            OnboardingView(viewModel: transactionViewModel)
        }
    }
}

#Preview {
    RootView()
}
