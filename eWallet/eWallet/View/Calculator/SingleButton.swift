//
//  SingleView.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

struct SingleButton: View {
    var height : CGFloat
    var width : CGFloat
    var buttonEnum : CalculatorButtonEnum
    var onButtonClicked : (CalculatorButtonEnum) -> Void
        
    var body: some View {
       
        Button {
            onButtonClicked(buttonEnum)
        } label: {
            Text(buttonEnum.rawValue.capitalized)
                .font(.system(size: 30))
                .minimumScaleFactor(0.1)
                .foregroundColor(.orange)
                .frame(width: width , height: height)
                .background(buttonEnum.backgroundColor)
        }
               
            
        }
    }

#Preview {
    SingleButton(height: 100, width: 100,buttonEnum: .one) { _ in
        
    }
}
