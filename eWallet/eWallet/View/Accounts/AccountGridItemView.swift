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
        VStack(alignment: .leading, spacing: 5) {
            
            Image(systemName: "bag")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(10)
                
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green)
                ).foregroundStyle(Color.white)
     

            
            Text(accountData.title)
                .foregroundStyle(Color.theme.secondaryText)
                .font(.system(size: 16))
               

            Text(getAmountText())
                .foregroundStyle(Color.theme.primaryText)
                .font(.system(size: 16))
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
       
        .padding(.leading, 15)
        .padding(.vertical, 10)
       
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.theme.primaryBG)
                .shadow(color: .gray, radius: 1)
        )
 
      
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
      //  .background(Color.red)
}
