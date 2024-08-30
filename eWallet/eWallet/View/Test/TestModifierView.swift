//
//  TestModifierView.swift
//  eWallet
//
//  Created by Habibur Rahman on 30/8/24.
//

import SwiftUI

struct TestModifierView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .foregroundStyle(Color.white)

            .padding(10)
            .WithDefaultRectangularBgModifier(bgColor: .green, cornerRadius: 10)
        
        Image(systemName: "chevron.compact.right")
            .resizable()
            .frame(width: 10,height: 10)
            .padding(5)
           
            .WithDefaultCircularBgModifier(bgColor: .red)
            
            .foregroundStyle(Color.white)
        
    }
}

#Preview {
    TestModifierView()
}
