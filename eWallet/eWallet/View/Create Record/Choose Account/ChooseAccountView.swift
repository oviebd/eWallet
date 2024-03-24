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
    
        VStack (spacing:20){
            ForEach(data, id: \.self) { _ in
                ChooseAccountItemView()
                Rectangle()
                    .fill(Color.theme.secondaryText.opacity(0.3))
                    .frame(height: 0.8)
                    
                    
            }
            Spacer()
        }
        
    }
}

#Preview {
    ChooseAccountView()
}
