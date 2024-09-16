//
//  ChartData.swift
//  eWallet
//
//  Created by Habibur Rahman on 13/9/24.
//

import Foundation

struct SingleBarChartData: Identifiable {
    var id = UUID()
    var date: Date
    var value: Double
}

struct BarChartData{
    var datas = [SingleBarChartData]()
}

struct SinglePieChartData : Identifiable  {
    var id : String = UUID().uuidString
    var key : String
    var value : Double
   
}

struct PieChartData   {
    var datas : [SinglePieChartData] = [SinglePieChartData]()
    var totalValue : Double {
        var sum = 0.0
        for data in datas {
            sum += data.value
        }
        return sum
    }
}

class ChartDataUtility {
    
    static let chartDataList = setupChartData()

    private static func setupChartData() -> [SingleBarChartData]{
        var datas = [SingleBarChartData]()
        for i in 0..<30 {
            datas.append(SingleBarChartData(date: .now.dayBefore(dayNumber: 30 - i) ?? .now, value: Double.random(in: 30.0...200.0)))
        }
        
        return datas
    }
  
    static let pieChartDataList = [
        SinglePieChartData(key: "one", value: 0.1),
        SinglePieChartData(key: "two", value: 0.4),
        SinglePieChartData(key: "three", value: 0.1),
        SinglePieChartData(key: "four", value: 0.5)
    
    ]
}
