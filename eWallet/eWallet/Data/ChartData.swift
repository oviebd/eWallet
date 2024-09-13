//
//  ChartData.swift
//  eWallet
//
//  Created by Habibur Rahman on 13/9/24.
//

import Foundation

struct SingleChartData: Identifiable {
    var id = UUID()
    var date: Date
    var value: Double
}

struct ChartData{
    var datas = [SingleChartData]()
//    var xAxisDates : [Date] = {
//       return [
//        .now.dayBefore(dayNumber: 18) ?? .now,
//        .now.dayBefore(dayNumber: 10) ?? .now,
//        .now.dayBefore(dayNumber: 5) ?? .now,
//        .now.dayBefore(dayNumber: 2) ?? .now,
//        .now
//       ]
//    }()
}

class ChartDataUtility {
    
    static let chartDataList = [
        
     
        SingleChartData(date: .now.dayBefore(dayNumber: 18) ?? .now, value: 3000.0),
        SingleChartData(date: .now.dayBefore(dayNumber: 16) ?? .now, value: 500.0),
        SingleChartData(date: .now.dayBefore(dayNumber: 14) ?? .now, value: 5000),
        SingleChartData(date: .now.dayBefore(dayNumber: 12) ?? .now, value: 1000.0),
        
        SingleChartData(date: .now.dayBefore(dayNumber: 10) ?? .now, value: 1000.0),
        SingleChartData(date: .now.dayBefore(dayNumber: 8) ?? .now, value: 5000),
        SingleChartData(date: .now.dayBefore(dayNumber: 7) ?? .now, value: 500.0),
        SingleChartData(date: .now.dayBefore(dayNumber: 1) ?? .now, value: 3000.0),
        SingleChartData(date: .now, value: 2000.0)
        
       
    ]

    
}
