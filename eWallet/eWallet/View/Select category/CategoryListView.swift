//
//  VerticalCircleCatagory.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

struct CategoryListView: View {
  
   // @ObservedObject private var vm = CategoryListVm()
    
    @State var categories : [Category] = []
    
    var body: some View {
        VStack {
            ForEach(categories) { item in
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
