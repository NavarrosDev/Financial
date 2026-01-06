//
//  FilterView.swift
//  Financial
//
//  Created by Gabriel Navarro on 05/01/26.
//

import SwiftUI

struct FilterView: View {
    @ObservedObject var viewModel: TransactionViewModel
    @State var filterTemp: [Filter] = []
    @Environment(\.dismiss) var dismiss
    
    init(viewModel: TransactionViewModel) {
        self._viewModel = ObservedObject(initialValue: viewModel)
        self._filterTemp = State(initialValue: viewModel.activeFilter)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Filtrar por")
                .font(.headline)
                .padding(.top)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                
                ForEach(Filter.allCases, id: \.self) { filter in
                    let isSelected = filterTemp.contains(filter)
                    filterChip(for: filter, sel: isSelected)
                }
            }
            .padding()
            
            Spacer()
            
            HStack {
                Button("Voltar") { dismiss() }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding()
                    .foregroundStyle(Color.red)
                
                Button("Aplicar") {
                    viewModel.activeFilter = filterTemp
                    dismiss()
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding()
                .foregroundStyle(Color.blue)
            }
        }
    }
    
    @ViewBuilder
    private func filterChip(for filter: Filter, sel isSelected: Bool) -> some View {
        
        Text(filter.rawValue)
            .font(.subheadline)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(isSelected ? Color.blue.opacity(0.1) : Color.gray.opacity(0.1))
            .foregroundStyle(isSelected ? .blue : .primary)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 1)
            )
            .onTapGesture {
                if filter == .all {
                    if filterTemp.contains(.all) {
                        filterTemp.removeAll()
                    } else {
                        filterTemp = Filter.allCases
                    }
                    return
                }
                
                if filterTemp.contains(filter) {
                    if let index = filterTemp.firstIndex(of: filter) {
                        filterTemp.remove(at: index)
                    }
                    
                    if let allIndex = filterTemp.firstIndex(of: .all) {
                        filterTemp.remove(at: allIndex)
                    }
                } else {
                    filterTemp.append(filter)
                    
                    let commonItem = Filter.allCases.filter { $0 != .all }
                        if commonItem.allSatisfy({ filterTemp.contains($0) }) {
                            if !filterTemp.contains(.all) {
                                filterTemp.append(.all)
                            }
                        }
                }
            }
    }
}

#Preview {
    FilterView(viewModel: TransactionViewModel())
}
