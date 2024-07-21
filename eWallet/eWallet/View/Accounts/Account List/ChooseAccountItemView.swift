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
        VStack {
            Image(systemName: "wallet.pass.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 15, height: 15)
                .padding(15)

        }.foregroundStyle(Color.white)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.theme.normalBlue)
            )
    }

    var rightView: some View {
        VStack(alignment: .leading) {
            Text(accountData.title)
                .font(.system(size: 16))
                .foregroundStyle(Color.theme.secondaryText.opacity(0.8))
                .fontWeight(.semibold)
                .lineLimit(1)
        
        }
    }
}
