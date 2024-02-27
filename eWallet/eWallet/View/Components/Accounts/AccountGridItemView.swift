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
                .font(.subheadline)
                .fontWeight(.semibold)

            Text("BDT 80,000")
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
                .fill(Color.theme.blue)
        )
        .foregroundColor(.blue)
        .shadow(color: .gray, radius: 1)
    }
}

#Preview {
    AccountGridItemView()
}
