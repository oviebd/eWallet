//
//  PieChartView.swift
//  eWallet
//
//  Created by Habibur Rahman on 14/9/24.
//

import Charts
import SwiftUI

struct PieChartView: View {
   
    @Binding var defaultData : PieChartData

    var body: some View {
      
        VStack{
            if defaultData.datas.count <= 0 {
                Text("No Data")
                    .font(.system(size: 30))
                    .bold()
            }else{
                Chart(defaultData.datas) { data in
                    SectorMark(angle: .value("Amount", data.value),
                               innerRadius: .ratio(0.6)
                    ).foregroundStyle(by: .value("Name", data.key))
                }
            }
           
        }
        
      
    }
}

#Preview {
    PieChartView(defaultData: .constant(PieChartData(datas: ChartDataUtility.pieChartDataList)))
}
