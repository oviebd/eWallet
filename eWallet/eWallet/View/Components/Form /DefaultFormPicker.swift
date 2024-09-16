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
    
    var isRequired : Bool = false
    var iconBgShape : BgShapeType = .roundedRectangle
    var iconBgColor : Color = .green
    var iconForgroundColor : Color = .white
    @Binding var isEditable : Bool
   
    
    var onItemPresesd : () -> Void
    
    var body: some View {
        
        HStack{
            
            if !iconName.isEmptyString() {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: getIconSize(), height: getIconSize())
                    .padding( iconBgShape == .none ? 0 : 10)
                    .modifier(DefaultBgModifier(bgColor: iconBgColor, cornerRadius: 9, shapeType: iconBgShape))
                    .foregroundStyle(iconForgroundColor)
                    .padding(.leading, iconBgShape == .none ? 10 : 0)
                    .padding(.vertical,iconBgShape == .none ? 10 : 0)
            }
            
           
            Text(mainTitle)
                .foregroundStyle(Color.theme.primaryText)
                .font(.system(size: 18))
                .padding(.horizontal,10)
            
            Spacer()
            
            Text(getRightTitle())
                .foregroundStyle(getRightTitleBgColor())
                .font(.system(size: 16))
            
            if isEditable {
                Image(systemName: "chevron.compact.right")
                    .resizable()
                    .frame(width: 7, height: 10)
                    .foregroundStyle(getRightTitleBgColor())
                    .offset(y:1.5)
                    .padding(.leading,5)
            }
            
        }
        .onTapGesture {
            onItemPresesd()
        }
    }
    
    func getIconSize() -> CGFloat{
        return iconBgShape == .none ? 25 : 20
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
    DefaultFormPicker(iconName: "bag", mainTitle: "Account", rightTitle: "Eastern Bank", isRequired: true, iconBgShape: .circle, iconBgColor: .green, isEditable: .constant(true)){
        
    }
}
