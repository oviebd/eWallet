//
//  ChooseAccountView.swift
//  eWallet
//
//  Created by Habibur Rahman on 24/3/24.
//

import SwiftUI

struct ChooseAccountView: View {
    private var data = Array(1 ... 3)
    var body: some View {
    
        VStack (spacing:15){
            ForEach(data, id: \.self) { _ in
                ChooseAccountItemView()
                Rectangle()
                    .fill(Color.theme.secondaryText.opacity(0.3))
                    .frame(height: 0.5)
                    
                    
            }
            Spacer()
        }.padding(.top,20)
        .background(Color.white)
        
    }
}

#Preview {
    ChooseAccountView()
}
