//
//  AddAccountGridItemView.swift
//  eWallet
//
//  Created by Habibur Rahman on 16/8/24.
//

import SwiftUI

struct AddAccountGridItemView: View {
  
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            
            Image(systemName: "plus")
                .resizable()
                .frame(width: 18, height: 18)
                .padding(10)
                
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.theme.normalBlue)
                ).foregroundStyle(Color.white)
     

            
            Text("Add Account")
                .foregroundStyle(Color.theme.primaryText)
                .font(.system(size: 16))
               

        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.vertical, 23)
       
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.theme.primaryBG)
                .shadow(color: .gray, radius: 1)
        )
 
      
    }
}

#Preview {
    AddAccountGridItemView()
}
