//
//  VerticalCircleCatagory.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

struct AllCatagoryItem: View {
    let allCategories = CategoryUtility().allCatagories

    var body: some View {
        VStack {
            ForEach(allCategories) { item in

                HStack(spacing: 20) {
                    SingleCircleItem(imageName: item.iconImage, color: item.color)

                    Text(item.title)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    AllCatagoryItem()
}
