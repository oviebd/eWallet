//
//  CashFlowView.swift
//  eWallet
//
//  Created by Habibur Rahman on 16/9/24.
//

import SwiftUI

struct CashFlowView: View {
    @StateObject var vm = ExpensePieChartVM()
   
    var body: some View {
     
        VStack {
            
            ZStack(alignment:.topTrailing){
                Text("Last 30 days")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .padding(.leading, 20)
                    .padding(10)
                    .foregroundStyle(Color.theme.accountGridCardBG)
                
                HStack (spacing:0){
                    Text("Expenses - ")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                        .padding(.top, 20)
                    
                    Text("\(vm.expensePieChartDataOf30Days.totalValue.to2Decimal())")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .padding(.top, 20)

                    Spacer()
                }.foregroundStyle(Color.theme.darkRed)
            }
            
            CustomProgressView(fillColor: Color.theme.accountGridCardBG, maxValue: 100, currentValue: .constant(50))
               // .frame(width: .infinity)
                .frame(height: 20)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            
            CustomProgressView(fillColor: Color.theme.darkRed, maxValue: 100, currentValue: .constant(80))
               // .frame(width: .infinity)
                .frame(height: 20)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)

        }.background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.theme.primaryBG)
                .shadow(color: .gray, radius: 1)
        )
    }
}

#Preview {
    CashFlowView()
}
