//
//  SelectCatagoryItems.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

struct SelectCatagoryView: View {
  
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Text("MOST FREQUENT")
                    .padding(.leading, 5)
                    
                
                
                RecentCatagoryItem()
                
                
                Text("All CATAGORIES")
                    .padding(.leading, 5)
                AllCatagoryItem()
                    .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    SelectCatagoryView()
}
