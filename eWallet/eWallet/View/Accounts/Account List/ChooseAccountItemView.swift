//
//  ChooseAccountItemView.swift
//  eWallet
//
//  Created by Habibur Rahman on 24/3/24.
//

import SwiftUI

struct ChooseAccountItemView: View {
    
    var accountData : AccountData
    
    var body: some View {
        HStack(spacing: 15) {
            iconView

            rightView

            Spacer()

        }.padding(.horizontal, 20)
    }
}

#Preview {
    ChooseAccountItemView(accountData: DummyDataUtils.dummyAccountData)
}

extension ChooseAccountItemView {
    var iconView: some View {
        Image(systemName: "wallet.pass.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 30, height:30)
        .padding(10)
        .WithDefaultRectangularBgModifier(bgColor: Color.theme.accountGridCardBG, cornerRadius: 8)
        .foregroundStyle(.white)
    }

    var rightView: some View {
        VStack(alignment: .leading) {
            Text(accountData.title)
                .font(.system(size: 20))
                .foregroundStyle(Color.theme.secondaryText.opacity(0.8))
                .fontWeight(.semibold)
                .lineLimit(1)
        
        }
    }
}
