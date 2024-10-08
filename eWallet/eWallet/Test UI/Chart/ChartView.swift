//
//  ChartView.swift
//  eWallet
//
//  Created by Habibur Rahman on 7/9/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    @State private var defaultData = barChartDefaultDatas
    @State private var targetData = barChartTargetDatas
    
    var body: some View {
        Chart {
            ForEach(defaultData) { data in
                BarMark(
                    x: .value("Month", data.date),
                    y: .value("Amount", data.value)
                )
               
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.white)
            }
            
        }
        .chartYScale(domain: 0...50)
        //Set x border to all white color
        .chartXAxis {
            AxisMarks(position:.bottom){ _ in
                AxisGridLine()
                    .foregroundStyle(.clear)
                
                AxisTick()
                    .foregroundStyle(.red)
                
                AxisValueLabel()
                    .foregroundStyle(.white)
                
            }
        }
        
        //Set y border to all white color
        .chartYAxis {
            AxisMarks(position:.leading){ value in
                AxisGridLine()
                    .foregroundStyle(.white.opacity(0.5))
                
                AxisTick()
                    .foregroundStyle(.white)
                
                AxisValueLabel()
                    .foregroundStyle(.white)
                
                AxisValueLabel(){
                    
                    if let amount = value.as(Double.self)  {
                        Text("$\(amount,specifier: "%.0f")")
                            .foregroundStyle(.white)
                    }
                    
                }
                
            }
        }
        .background(Color.theme.darkBlue)
//        .onAppear{
//            animatedChart()
//        }
    }
    
//    private func animatedChart(){
//        for (index, target) in targetData.enumerated() {
//            withAnimation(.easeInOut(duration: 1.0).delay(Double(index) * 0.1)){
//                defaultData[index].amount = target.value
//            }
//        }
//    }
}

#Preview {
    ChartView()
}
