//
//  ChartData.swift
//  eWallet
//
//  Created by Habibur Rahman on 7/9/24.
//

import Foundation

struct BarChartData : Identifiable  {
    let id : String = UUID().uuidString
    var amount : Int
    var month : String
}

let barChartDefaultDatas : [BarChartData] = [
    BarChartData(amount: 0, month: "Jan"),
    BarChartData(amount: 0, month: "Fab"),
    BarChartData(amount: 0, month: "Mar"),
    BarChartData(amount: 0, month: "Apr"),
    BarChartData(amount: 0, month: "May"),
    BarChartData(amount: 0, month: "Jun"),
    
]

let barChartTargetDatas : [BarChartData] = [
    BarChartData(amount: 10, month: "Jan"),
    BarChartData(amount: 20, month: "Fab"),
    BarChartData(amount: 25, month: "Mar"),
    BarChartData(amount: 5, month: "Apr"),
    BarChartData(amount: 35, month: "May"),
    BarChartData(amount: 25, month: "Jun"),
    
]
