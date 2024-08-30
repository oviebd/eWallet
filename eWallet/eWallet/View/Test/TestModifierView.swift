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
            .WithDefaultBgModifier(bgColor: .blue, cornerRadius: 10, shapeType: .roundedRectangle)
        
        Image(systemName: "chevron.compact.right")
            .resizable()
            .frame(width: 20,height: 20)
            .padding(10)
            .WithDefaultBgModifier(bgColor: .red, cornerRadius: 15, shapeType: .circle)
            
            .foregroundStyle(Color.white)
        
    }
}

#Preview {
    TestModifierView()
}
