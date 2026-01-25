//
//  DashboardView.swift
//  Financial
//
//  Created by Gabriel Navarro on 24/12/25.
//

import SwiftUI
import Charts

struct DashboardView: View {
    @ObservedObject var viewModel: TransactionViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    Text("Visão Geral")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    if viewModel.expensesByCategory.isEmpty {
                        contentEmptyView()
                    } else {
                        chartView()
                    }
                    
                }
                .padding(.top)
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .navigationTitle("Análise")
        }
    }
    
    @ViewBuilder
    func chartView() -> some View {
        VStack {
            ZStack {
                let totalExpenses = viewModel.expensesByCategory.reduce(0) { $0 + $1.total }
                Chart(viewModel.expensesByCategory) { item in
                    let percetage = (item.total / totalExpenses) * 100
                    SectorMark(
                        angle: .value("Gasto", item.total),
                        innerRadius: .ratio(0.65),
                        angularInset: 1.5
                    )
                    .cornerRadius(5)
                    .foregroundStyle(by: .value("Categoria", item.category))
                    .annotation(position: .overlay) {
                        if percetage > 5 {
                            Text("\(percetage, specifier: "%.0.f")%")
                                .font(.caption)
                                .bold()
                                .foregroundStyle(.white)
                        }
                    }
                }
                .frame(height: 250)
                .chartLegend(position: .bottom, spacing: 20)
                
                VStack {
                    Text("Total Gastos")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Text(totalExpenses, format: .currency(code: "BRL"))
                        .font(.headline)
                        .bold()
                        .contentTransition(.numericText())
                }
            }
        }
        .padding()
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func contentEmptyView() -> some View {
        VStack(spacing: 12) {
            Image(systemName: "chart.pie")
                .font(.system(size: 50))
                .foregroundStyle(.gray)
            Text("Sem dados de despesas para analisar.")
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(40)
    }
}

#Preview {
    DashboardView(viewModel: TransactionViewModel())
}
