//
//  VerticalItem.swift
//  PickerPlus
//
//  Created by Alejandro Ulate on 13/2/23.
//

import SwiftUI

struct SegmentedPickerItem: View {
    var item: RecordTypeEnum
    var isSelected: Bool = false
    
    var body: some View {
        VStack {
            Text(item.rawValue.capitalized)
                .font(Font.footnote
                    .weight(isSelected ? .heavy : .medium)
                )
                .foregroundStyle(Color.theme.primaryText)
              //  .foregroundColor(isSelected ? Color.white.opacity(1.0) : Color.white.opacity(0.8))
                .padding(.horizontal, 8)
                .frame(maxWidth: .infinity)
                .background(Color.clear)
                .multilineTextAlignment(.center)
        }
    }
}

struct SegmentedPickerItem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            SegmentedPickerItem(item: .INCOME)
        }.background(Color.black)
       
    }
}
