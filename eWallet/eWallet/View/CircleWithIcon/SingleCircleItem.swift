//
//  SingleCircleItem.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

struct SingleCircleItem: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 60)
                .foregroundColor(.red)

            Image(systemName: "stethoscope.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    SingleCircleItem()
}
