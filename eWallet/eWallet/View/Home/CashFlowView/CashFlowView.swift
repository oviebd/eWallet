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
            
            VStack (spacing: 0){
                ZStack(alignment:.topTrailing){
                    Text("This Month")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .padding(10)
                        .foregroundStyle(Color.theme.accountGridCardBG)
                        .offset(x: 20)
                        .offset(y : -5)
                    
                    HStack (spacing:0){
                        Text("Cash Flow ")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .padding(.top, 20)
                        Spacer()
                    }.foregroundStyle(Color.theme.primaryText)
                }.padding(.top,5)
                
               incomeView
                    .padding(.top,10)
                
               expenseView
                    .padding(.top,10)
                    .padding(.bottom,30)
                
                
            } .padding(.horizontal, 20)
            
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

extension CashFlowView {
    var incomeView : some View {
        VStack(spacing : 10) {
            HStack (spacing:0){
                Text("Income")
                    
                Spacer()
                
                Text("20,000")
                    
            }.foregroundStyle(Color.theme.accountGridCardBG)
                .font(.system(size: 18))
                .fontWeight(.bold)
            
            
            CustomProgressView(fillColor: Color.theme.accountGridCardBG, maxValue: 100, currentValue: .constant(50))
                .frame(height: 25)
        }
        
    }
    
    var expenseView : some View {
        VStack(spacing : 10) {
            HStack (spacing:0){
                Text("Expense")
                    
                Spacer()
                
                Text("20,000")
                    
            }.foregroundStyle( Color.theme.darkRed)
                .font(.system(size: 18))
                .fontWeight(.bold)
            
            
            CustomProgressView(fillColor: Color.theme.darkRed, maxValue: 100, currentValue: .constant(100))
                .frame(height: 25)
        }
        
    }
}
