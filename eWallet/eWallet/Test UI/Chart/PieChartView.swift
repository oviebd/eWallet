//
//  PieChartView.swift
//  eWallet
//
//  Created by Habibur Rahman on 7/9/24.
//

import SwiftUI
import Charts


struct PieChartView: View {
    
    @State private var defaultData : [BarChartData] = barChartDefaultDatas
    @State private var targetData : [BarChartData] = barChartTargetDatas
    
    
    var body: some View {
        Chart(defaultData) { data in
            SectorMark(angle: .value("Amount", data.amount),
                       innerRadius: .ratio(0.6)
            ).foregroundStyle(by: .value("Name", data.month))
        }.onAppear{
            animatedChart()
        }
    }
    
    private func animatedChart(){
        for (index, target) in targetData.enumerated() {
            withAnimation(.easeInOut(duration: 1.0).delay(Double(index) * 0.1)){
                defaultData[index].amount = target.amount
            }
        }
    }
}

#Preview {
    PieChartView()
}
