//
//  DefaultDividerView.swift
//  eWallet
//
//  Created by Habibur Rahman on 30/8/24.
//

import SwiftUI

struct DefaultDividerView: View {
    var height = 0.5
    var bgColor = Color.gray.opacity(0.5)
   
    var body: some View {
        Rectangle()
            .frame(height: height)
            .foregroundStyle(bgColor)
    }
}

#Preview {
    DefaultDividerView()
}
