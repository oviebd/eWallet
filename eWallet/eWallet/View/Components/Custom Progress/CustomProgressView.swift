//
//  CustomProgressView.swift
//  eWallet
//
//  Created by Habibur Rahman on 16/9/24.
//

import SwiftUI

struct CustomProgressView: View {
   
    let fillColor: Color
    let maxValue : CGFloat
    @Binding var currentValue : CGFloat
   
    let height = 30.0
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: geometry.size.width)
                    .opacity(0.3)
                    .foregroundColor(.gray)

                RoundedRectangle(cornerRadius: 3)
                    .frame(
                        width: min(getProgress() * geometry.size.width,
                                   geometry.size.width)
                    )
                    .foregroundColor(fillColor)
            }
        }//.frame(height: height)
    }
    
    func getProgress() -> CGFloat {
        return (currentValue / maxValue)
    }
}

#Preview {
    CustomProgressView(fillColor: Color.theme.accountGridCardBG, maxValue: 100, currentValue:.constant(20))
}
