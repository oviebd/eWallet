//
//  ChooseAccountItemView.swift
//  eWallet
//
//  Created by Habibur Rahman on 24/3/24.
//

import SwiftUI

struct ChooseAccountItemView: View {
    var body: some View {
        HStack {
            iconView

            rightView

            Spacer()

        }.padding(.horizontal, 20)
    }
}

#Preview {
    ChooseAccountItemView()
}

extension ChooseAccountItemView {
    var iconView: some View {
        VStack {
            Image(systemName: "wallet.pass.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 22, height: 22)
                .padding(20)

        }.foregroundStyle(Color.white)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.theme.normalBlue)
            )
    }

    var rightView: some View {
        VStack(alignment: .leading) {
            Text("City Bank")
                .font(.system(size: 20))
                .foregroundStyle(Color.theme.secondaryText.opacity(0.8))
                .fontWeight(.semibold)
                .lineLimit(1)
            Text("Cash")
                .font(.system(size: 15))
                .foregroundStyle(Color.theme.secondaryText.opacity(0.5))
                .fontWeight(.semibold)
                .lineLimit(1)
        }
    }
}
