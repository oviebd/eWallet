//
//  RecordTypeSegmentedView.swift
//  eWallet
//
//  Created by Habibur Rahman on 20/3/24.
//

import SwiftUI

struct RecordTypeSegmentedView: View {
    
    @State private var selectedItem = RecordTypeEnum.INCOME
    @State var selectedIndex : Int = 0
   
    
    var body: some View {
        CustomSegmentedPicker(
            RecordTypeEnum.allCases,
            selection: selectedItem,
            indicatorBuilder: {
                
                GeometryReader { geo in
                    SegmentedPickerIndicatorView(width: geo.size.width / CGFloat(RecordTypeEnum.allCases.count), selectedItemIndex: $selectedIndex)
                        .backgroundColor(Color.mediumDarkBlue)
                }
                .cornerRadius(0)
                .shadow(color: Color.theme.darkBlue.opacity(0.5), radius: 2, x: 2, y: 0)
                
                  
            },
            itemBuilder: { item  in
                SegmentedPickerItem(
                    item: item,
                    isSelected: selectedItem == item
                )
                .padding(.vertical, 8)
                .onTapGesture {
                    selectedItem = item
                    withAnimation(.easeInOut(duration: 0.150)) {
                        selectedItem = item
                        if let index = RecordTypeEnum.allCases.firstIndex(of: selectedItem){
                            selectedIndex = index
                        }
                    }
                }
            }
        ).pickerBackgroundColor(Color.theme.normalBlue)
    }
}

#Preview {
    RecordTypeSegmentedView()
}
