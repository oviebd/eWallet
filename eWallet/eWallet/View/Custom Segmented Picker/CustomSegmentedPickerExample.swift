//
//  PickerExample.swift
//  eWallet
//
//  Created by Habibur Rahman on 20/3/24.
//

import SwiftUI

struct CustomSegmentedPickerExample: View {
    @State private var selectedItem = RecordTypeEnum.INCOME
    @State var selectedIndex : Int = 0
   
    var body: some View {
        Text("Custom Picker: Vertical Items")
        CustomSegmentedPicker(
            RecordTypeEnum.allCases,
            selection: selectedItem,
            indicatorBuilder: {
                
                GeometryReader { geo in
                    SegmentedPickerIndicatorView(width: geo.size.width / CGFloat(RecordTypeEnum.allCases.count), selectedItemIndex: $selectedIndex)
                }
                  
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
        )
        .pickerBackgroundColor(Color.accentColor)
        .frame(height: 64)
        .cornerRadius(15)
        .padding()
    }
}

#Preview {
    CustomSegmentedPickerExample()
}
