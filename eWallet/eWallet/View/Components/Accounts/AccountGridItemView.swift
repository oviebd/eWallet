//
//  AccountGridItemView.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/2/24.
//

import SwiftUI

struct AccountGridItemView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("City Bank")
                .foregroundStyle(Color.theme.white)
                .font(.headline)

            Text("BDT 80,000")
                .foregroundStyle(Color.theme.white)
                .font(.callout)

        }.padding(.trailing, 20)
            .padding(.leading, 10)
            .padding(.vertical, 2)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.theme.blue)
            )
            .foregroundColor(.blue)
            .shadow(color: .gray, radius: 1)
    }
}

#Preview {
    AccountGridItemView()
}
