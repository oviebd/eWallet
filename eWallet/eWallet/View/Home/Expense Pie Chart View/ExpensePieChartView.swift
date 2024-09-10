//
//  ExpensePieChartView.swift
//  eWallet
//
//  Created by Habibur Rahman on 10/9/24.
//

import SwiftUI

struct ExpensePieChartView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Expenses")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                // .padding(.bottom,10)

                Spacer()
            }

            PieChartView()
               // .frame(width: .infinity)
                .frame(height: 200)
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
    ExpensePieChartView()
}
