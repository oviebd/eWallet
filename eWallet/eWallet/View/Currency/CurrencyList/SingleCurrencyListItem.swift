//
//  SingleCurrencyListItem.swift
//  eWallet
//
//  Created by Habibur Rahman on 2/7/24.
//

import SwiftUI

struct SingleCurrencyListItem: View {
    
    let currencyData : CurrencyData
    
    var body: some View {
        HStack {
            Text(currencyData.title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
            Spacer()
        }.foregroundStyle(Color.white)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.theme.normalBlue)
            )
            .padding(.horizontal, 10)
    }
}

#Preview {
    SingleCurrencyListItem(currencyData: CurrencyData(title: "Currency Name", symbol: "Symbol", icon: "Icon", short_code: "ShortCode"))
}
