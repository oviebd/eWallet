//
//  ChooseAccountView.swift
//  eWallet
//
//  Created by Habibur Rahman on 24/3/24.
//

import SwiftUI

struct ChooseAccountView: View {
    
    @Binding public var isViewShowing : Bool
    private let topBarConfig = CommonTopBarData(title: "Choose Account", bgColor: Color.theme.darkBlue, leftIconName: "chevron.left", rightIconName: "")
    var data = Array(1 ... 3)
    
    var body: some View {
    
        VStack(spacing:20){
            
            CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                print("Left Btn Pressed")
                withAnimation {
                    isViewShowing = false
                }
                
            })
            
            VStack (spacing:15){
                
                ForEach(data, id: \.self) { _ in
                    ChooseAccountItemView()
                    Rectangle()
                        .fill(Color.theme.secondaryText.opacity(0.3))
                        .frame(height: 0.5)
                        
                        
                }
               
            }
            
            Spacer()
        }
        .background(Color.white)
        
    }
}

#Preview {
    ChooseAccountView(isViewShowing: .constant(true))
}
