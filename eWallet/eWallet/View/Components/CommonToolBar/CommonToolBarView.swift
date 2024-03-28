//
//  CommonToolBarView.swift
//  eWallet
//
//  Created by Habibur Rahman on 28/3/24.
//

import SwiftUI

struct CommonToolBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "arrow.backward")
            .padding()
           Spacer()
            
            Text("Account")
                
            
            Spacer()
            
          Image(systemName: "seal")
                .padding()
                
           
        }
        .frame(width: 395, height: 100)
        .background(.blue)
        Spacer()
        
    }
}

#Preview {
    CommonToolBarView()
}
