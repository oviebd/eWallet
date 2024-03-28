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
                .frame(width: 50)
                .foregroundColor(color)

            Image(systemName: imageName)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    SingleCircleItem(imageName: "stethoscope.circle", color: .green)
}
