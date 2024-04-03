//
//  RecentCatagoryItem.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

struct RecentCatagoryItem: View {
    let allCategories = CategoryUtility().allCatagories
   
    var body: some View {
        
        ScrollView(.horizontal) {
         
            HStack(spacing: 40) {
                
                ForEach(allCategories) { index in
                    VStack {
                        
                        SingleCircleItem(imageName: index.iconImage, color: index.color)
                        Text(index.title)
                            .font(.subheadline)
                        
                    }.padding(.horizontal, 4)
                    
                    
                }
                
                
            }.padding(.leading, 10)
        }
    
        
//        List {
//            Section( header: Text("MOST FREQUENT")) {
//
//            }
            
      //  }.listStyle(GroupedListStyle())
           
    }
}

#Preview {
    RecentCatagoryItem()
}
