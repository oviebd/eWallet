//
//  DefaultFormPicker.swift
//  eWallet
//
//  Created by Habibur Rahman on 30/8/24.
//

import SwiftUI


struct DefaultFormPicker: View {
    
    let iconName : String
    let mainTitle : String
    let rightTitle : String
    let isRequired : Bool
    
  //  func onPressed : (void)
    
    var body: some View {
        HStack{
            
            Image(systemName: iconName)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(10)
                .WithDefaultRectangularBgModifier(bgColor: .green, cornerRadius: 9)
                .foregroundStyle(Color.white)
            
            Text(mainTitle)
                .foregroundStyle(Color.theme.primaryText)
                .font(.system(size: 18))
                .padding(.horizontal,10)
            
            Spacer()
            
            Text(getRightTitle())
                .foregroundStyle(getRightTitleBgColor())
                .font(.system(size: 16))
            
            Image(systemName: "chevron.compact.right")
                .resizable()
                .frame(width: 7, height: 10)
                .foregroundStyle(getRightTitleBgColor())
                .offset(y:1.5)
                .padding(.leading,5)
        }
       
        .padding(.horizontal,20)
        .padding(.vertical,15)
        .background(Color.theme.white)
        
        .onTapGesture {
            //vm.isAccountTypePressed = true
        }
    }
    
    func getRightTitleBgColor() -> Color {
        if rightTitle.isEmptyString() && isRequired {
            return .red
        }
        return Color.theme.secondaryText
    }
    
    func getRightTitle() -> String {
        
        if rightTitle.isEmptyString() {
            return isRequired ? "Required" : "Select"
        }
        return rightTitle
    }
}

#Preview {
    DefaultFormPicker(iconName: "bag", mainTitle: "Account", rightTitle: "Eastern Bank", isRequired: true)
}
