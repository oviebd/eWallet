//
//  SelectCatagoryItems.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

struct SelectCatagoryView: View {
   // var catagory1 = RecentCatagoryItem
    
    var body: some View {
        ScrollView {
            VStack {
                RecentCatagoryItem()
            }
        }
    }
}

#Preview {
    SelectCatagoryView()
}
