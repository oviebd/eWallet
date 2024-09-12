//
//  AreaChartView.swift
//  eWallet
//
//  Created by Habibur Rahman on 11/9/24.
//

import SwiftUI

import SwiftUI
import Charts


struct AreaChartView: View {
    
    let maxHeight: CGFloat = 250
    let minHeight : CGFloat = 100
    var topEdge: CGFloat = 0
    @Binding var offset: CGFloat
    
    var body: some View {
        
        VStack{
            
            VStack{
                Spacer()
                header
                    .padding(.horizontal,20)
                    .frame(height: 100)
                
                chart
                   
                 .chartXAxis {
                     AxisMarks(values: .stride(by: .day)) { _ in
                         AxisTick()
                         AxisGridLine()
                         AxisValueLabel(format: .dateTime.weekday(.abbreviated), centered: true)
                     }
                 }
                 .padding(.horizontal,15)
                 .padding(.bottom,15)
                 .opacity(getProgress())
                
            }
          
            
        }  // Sticky Effect ...
        .frame(height: getHeight())
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.theme.white.opacity(1.0)))
    }
    
    func getHeight() -> CGFloat {
        var topHeight = maxHeight + offset
        if topHeight < 0 {
            topHeight = 0
        }
        
        if topHeight > maxHeight {
            topHeight = maxHeight
        }
        if topHeight <= minHeight {
            topHeight = minHeight
        }
        
        return topHeight// > maxHeight ? maxHeight : topHeight
    }
    
    
    
    func getProgress() -> CGFloat {
        let progress = -offset / (maxHeight - topEdge)
        return 1 - progress * 1.5
    }
}

#Preview {
    AreaChartView(offset: .constant(0))
}

extension AreaChartView {
    
    
    var header : some View {
       
        VStack(alignment:.leading){
           
            Spacer()
            
            Text("Last 30 Days")
                .font(.system(size: 20))
                .foregroundStyle(Color.theme.secondaryText)
            
            HStack (alignment: .bottom, spacing:4){
                Text("15700")
                    .font(.system(size: 34))
                    .bold()
                
                Text("Bdt")
                    .font(.system(size: 28))
                Spacer()
                   
            }
            .foregroundStyle(Color.theme.primaryText)
           
            Spacer()
        }
    }
    
    var chart : some View {
        Chart {
            ForEach(weight) { data in
                LineMark(
                    x: .value("Day", data.date, unit: .day),
                    y: .value("Weight", data.weight)
                )
                .foregroundStyle(Color.theme.darkBlue)
            }
            
           
            // Area Chart
            ForEach(weight) { data in
                AreaMark(
                    x: .value("Day", data.date, unit: .day),
                    yStart: .value("WeightLow", 63),
                    yEnd: .value("WeightLow",  data.weight)
                )
              .foregroundStyle(blueGradient)
            }
            
        }
        .chartYScale(domain: 62...70)
    }
    
    
}

var blueGradient: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors: [
                Color.theme.normalBlue.opacity(0.9),
                Color.theme.normalBlue.opacity(0.5),
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )
}
