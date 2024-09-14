//
//  ChartHolderView.swift
//  eWallet
//
//  Created by Habibur Rahman on 7/9/24.
//

import SwiftUI

struct ChartHolderView: View {
    var body: some View {
       
        VStack{
            
            ChartView()
                .frame(width: .infinity)
                .frame(height:200 )
            
            PieChartViewTest()
               // .frame(width: .infinity)
                .frame(height:200 )
            
            AreaChartViewTest()
            
        }
        
        
    }
}

#Preview {
    ChartHolderView()
}
