//
//  AreaChartViewTest.swift
//  eWallet
//
//  Created by Habibur Rahman on 7/9/24.
//

import SwiftUI
import Charts


// Data Model
struct TestWeight: Identifiable {
    var id = UUID()
    var weight: Double
    var date: Date

    init(id: UUID = UUID(), weight: Double, day: Int) {
        self.id = id
        self.weight = weight
        let calendar = Calendar.current
        self.date = calendar.date(from: DateComponents(year: 2023, month: 10, day: day))!
    }
}

// Test data
var weight: [TestWeight] = [
    TestWeight(weight: 69.4, day: 2),
    TestWeight(weight: 69.2, day: 3),
    TestWeight(weight: 70.0, day: 4),
    TestWeight(weight: 69.7, day: 5),
    TestWeight(weight: 69.0, day: 6),
    TestWeight(weight: 68.8, day: 7),
    TestWeight(weight: 68.0, day: 8)
]

struct AreaChartViewTest: View {
    var body: some View {
       
        VStack{
            
            Chart {
                ForEach(weight) { data in
                    LineMark(
                        x: .value("Day", data.date, unit: .day),
                        y: .value("Weight", data.weight)
                    ).symbol {
                        Circle()
                            .fill(Color.pink)
                            .frame(width: 8)
                    }
                    .foregroundStyle(Color.pink)
                }
            }
            .frame(height: 150)
            .chartYScale(domain: 62...70)
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { _ in
                    AxisTick()
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.weekday(.abbreviated), centered: true)
                }
            }
        }.padding()
        
       
        
    }
}

#Preview {
    AreaChartViewTest()
}
