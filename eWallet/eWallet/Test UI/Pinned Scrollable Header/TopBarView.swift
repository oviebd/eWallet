//
//  TopBarView.swift
//  eWallet
//
//  Created by Habibur Rahman on 15/8/24.
//

import SwiftUI

struct TopBarView: View {
    
    var topEdge : CGFloat
    @Binding var offset : CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            
            Image("Pic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            
            Text("Game of Thorns")
                .font(.largeTitle.bold())
            Text("Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.")
                .fontWeight(.semibold)
                .foregroundStyle(Color.white.opacity(0.8))
            
            
            
            
        }
        .padding()
        .padding(.bottom)
        

    }
}

#Preview {
    TopBarView(topEdge: 500, offset: .constant(10))
}
