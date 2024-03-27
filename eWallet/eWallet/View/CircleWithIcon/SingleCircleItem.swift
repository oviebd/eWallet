//
//  SingleCircleItem.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

struct SingleCircleItem: View {
   
    let allCategories = CategoryUtility().allCatagories
    var imageName : String
    var color : Color
   
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 60)
                .foregroundColor(color)

            Image(systemName: imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    SingleCircleItem(imageName: "stethoscope.circle", color: .green)
}
