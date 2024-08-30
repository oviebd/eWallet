//
//  SingleCircleItem.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

//enum Shape {
//    case circle
//    case rectangle
//}

struct ImageInBg: View {
   
    var imageName : String
    var bgColor : Color
    var cornerRadius : CGFloat = 10.0
    var imagePadding : CGFloat = 20.0
   
    var body: some View {
        Image(systemName: imageName)
            .resizable()
//                .frame(width: 50, height: 50)
            .foregroundColor(.white)
            .padding(imagePadding)
            .background{
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundStyle(bgColor)
            }
    }
}

#Preview {
    ImageInBg(imageName: "stethoscope.circle", bgColor: .green)
}
