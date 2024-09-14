//
//  AreaChartView.swift
//  eWallet
//
//  Created by Habibur Rahman on 11/9/24.
//

import SwiftUI

import Charts
import SwiftUI

struct AreaChartView: View {
    let maxHeight: CGFloat = 250
    let minHeight: CGFloat = 100
    var topEdge: CGFloat = 0
    @Binding var offset: CGFloat
    @Binding var chartDatas: BarChartData

    var body: some View {
        VStack {
            VStack {
                Spacer()
                header
                    .padding(.horizontal, 20)
                    .frame(height: 100)

                chart
                    .padding(.horizontal, 30)
                    .padding(.bottom, 15)
                    .opacity(getProgress())
            }
        } // Sticky Effect ...
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

        return topHeight // > maxHeight ? maxHeight : topHeight
    }

    func getProgress() -> CGFloat {
        let progress = -offset / (maxHeight - topEdge)
        return 1 - progress * 1.5
    }
}

#Preview {
    AreaChartView(offset: .constant(0), chartDatas: .constant(BarChartData(datas: ChartDataUtility.chartDataList)))
}

extension AreaChartView {
    var header: some View {
        VStack(alignment: .leading) {
            Spacer()

            Text("Last 30 Days")
                .font(.system(size: 20))
                .foregroundStyle(Color.theme.secondaryText)

            HStack(alignment: .bottom, spacing: 4) {
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

    var chart: some View {
        Chart {
            ForEach(chartDatas.datas, id: \.id) { item in
                LineMark(x: .value("Date", item.date),
                         y: .value("Profit", item.value))
                 //   .lineStyle(.init(lineWidth: 1, lineCap: .round, lineJoin: .round))
            }
            .foregroundStyle(Color.theme.accountGridCardBG)
            .interpolationMethod(.stepCenter)

            // Area Chart
            ForEach(chartDatas.datas) { data in
                AreaMark(
                    x: .value("Day", data.date),
                    yStart: .value("WeightLow", 0),
                    yEnd: .value("WeightLow", data.value)
                )
               
                .foregroundStyle(blueGradient)
                .interpolationMethod(.stepCenter)
            }
        }
        
        .chartXAxis{
            AxisMarks(preset: .aligned, values: stride(from: 0, to: chartDatas.datas.count, by: 1).map { chartDatas.datas[$0].date }) { value in
               
                AxisTick()
                AxisGridLine()
                
                if value.index % 5 == 0 {
                    AxisValueLabel {
                        if let yearMonthDay = value.as(Date.self) {
                            Text("\(yearMonthDay.asDateForChart())")
                               // .padding(.top, 10)
                        }
                    }
                }
            }
        }
        
        .chartXAxis {
            AxisMarks(preset: .aligned, values: stride(from: 0, to: chartDatas.datas.count, by: 10).map { chartDatas.datas[$0].date }) { value in
                //     AxisMarks(preset: .aligned, position: .bottom,values: stride(from: 0, to: chartDatas.xAxisDates.count , by: 1).map { chartDatas.xAxisDates[$0] }) { value in
                AxisValueLabel {
                    if let yearMonthDay = value.as(Date.self) {
                        Text("\(yearMonthDay.asDateForChart())")
                            .padding(.top, 10)
                    }
                }
                
                AxisTick()
                AxisGridLine()
                //AxisValueLabel(format: .dateTime.day(.abbreviated), centered: true)
            }
        }
        
        
        .chartYAxis {
            AxisMarks(position: .leading, values: .automatic) { value in
                AxisGridLine()
                AxisValueLabel {
                    if let intValue = value.as(Int.self) {
                        Text("\(intValue)")
                    }
                }
            }
        }
    }
}

var blueGradient: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors: [
                Color.theme.accountGridCardBG.opacity(0.9),
                Color.theme.accountGridCardBG.opacity(0.5),
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )
}
