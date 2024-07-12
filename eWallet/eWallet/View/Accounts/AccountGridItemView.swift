//
//  AccountGridItemView.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/2/24.
//

import SwiftUI

struct AccountGridItemView: View {
    
    var accountData : AccountData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(accountData.title)
                .foregroundStyle(Color.theme.white)
                .font(.subheadline)
                .fontWeight(.semibold)

            Text(getAmountText())
                .foregroundStyle(Color.theme.white)
                .font(.footnote)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .edgesIgnoringSafeArea(.all)
        .padding(.trailing, 5)
        .padding(.leading, 10)
        .padding(.vertical, 5)
       
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.theme.normalBlue)
        )
        .foregroundColor(.blue)
        .shadow(color: .gray, radius: 1)
    }
    
    
    func getAmountText() -> String {
        guard let currency = accountData.currencyData else {
            return ""
        }
        
        let shortCode = currency.short_code
        let res = "\(shortCode) \(accountData.amount)"
        return res
    }
}

#Preview {
    AccountGridItemView(accountData: DummyDataUtils.dummyAccountData)
}
