//
//  PieChartViewTest.swift
//  eWallet
//
//  Created by Habibur Rahman on 7/9/24.
//

import Charts
import SwiftUI

struct PieChartViewTest: View {
    @State private var defaultData = ChartDataUtility.pieChartDataList

    var body: some View {
        Chart(defaultData) { data in
            SectorMark(angle: .value("Amount", data.value),
                       innerRadius: .ratio(0.6)
            ).foregroundStyle(by: .value("Name", data.key))
        }
    }
}

#Preview {
    PieChartViewTest()
}
