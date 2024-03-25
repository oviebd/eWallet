//
//  VerticalCircleCatagory.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

struct AllCatagoryItem: View {
    var body: some View {
            List {
                Section( header: Text("ALL CATAGORIES")) {
                    ScrollView {
                        VStack {
                            ForEach(0 ..< 10) { item in
                                Section {
                                    HStack(spacing: 20) {
                                        SingleCircleItem()
                                        
                                        Text("Health")
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
            }.listStyle(GroupedListStyle())
            
        }
    }


#Preview {
    AllCatagoryItem()
}
