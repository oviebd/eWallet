//
//  VerticalCircleCatagory.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

struct CategoryListView: View {
  
    let allCategories = CategoryUtility().allCatagories
    let coreCateDataVm = CoreDataCategoryVM()
    
    var body: some View {
        VStack {
            ForEach(allCategories) { item in
                Divider()
                    .background(Color.gray)
                    
                HStack(spacing: 15) {
                    SingleCircleItem(imageName: item.iconImage, color: item.color)
                    Text(item.title)
                        .font(.subheadline)
                    Spacer()
                }.padding(.horizontal, 10)
            }
        }
    }
}

#Preview {
    CategoryListView()
}
