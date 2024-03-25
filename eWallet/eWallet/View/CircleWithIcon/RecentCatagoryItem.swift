//
//  RecentCatagoryItem.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

struct RecentCatagoryItem: View {
    var body: some View {
        List {
            Section( header: Text("MOST FREQUENT")) {
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 30) {
                        ForEach(0..<9) { index in
                            VStack {
                                SingleCircleItem()
                                Text("Health")
                                
                            }
                            
                            
                        }
                        
                    }.padding(.leading, 10)
                }
            }
            
        }.listStyle(GroupedListStyle())
           
    }
}

#Preview {
    RecentCatagoryItem()
}
