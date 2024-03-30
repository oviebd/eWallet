//
//  CommonTopBar.swift
//  eWallet
//
//  Created by Habibur Rahman on 30/3/24.
//

import SwiftUI

struct CommonTopBarData{
    var title : String
    var bgColor : Color
    var leftIconName : String
    var rightIconName : String
   
//    var onLeftButtonClicked : (() -> Void)?
//    var onRightButtonClicked : (() -> Void)?
    
    var hasLeftIcon : Bool {
        return !leftIconName.isEmpty
    }
    
    var hasRightIcon : Bool {
        return !rightIconName.isEmpty
    }
}


struct CommonTopBar: View {
    
    @Environment(\.presentationMode) var presentationMode
   
//    let title: String
//    let bgColor : UIColor
//    let leftIconName : String
//    let rightIconName : String
//   
    private var onLeftButtonClicked : (() -> Void)?
    private var onRightButtonClicked : (() -> Void)?
    private var data : CommonTopBarData
    
    init(data : CommonTopBarData,
         onLeftButtonClicked : (() -> Void)? = nil ,
         onRightButtonClicked : (() -> Void)? = nil
    
    ) {
        self.data = data
        self.onLeftButtonClicked = onLeftButtonClicked
        self.onRightButtonClicked = onRightButtonClicked
    }
    
    var body: some View {
        HStack(spacing: 0) {
            if data.hasLeftIcon{
                leftButton
            }
            
            titleSection
                .padding(.leading, 15)

            Spacer()

            if data.hasRightIcon{
                rightButton
            }

        }.padding()
            .font(.title3)
            .foregroundStyle(Color.white)
            .background(data.bgColor.ignoresSafeArea())
    }
}

#Preview {
    CommonTopBar(data: DataUtility.dummyCommonTopBar)
}

extension CommonTopBar  {
  
    private var leftButton: some View {
        Button {
            //presentationMode.wrappedValue.dismiss()
            if let action = onLeftButtonClicked{
                action()
            }
        } label: {
            Image(systemName: data.leftIconName)
        }
    }

    private var titleSection: some View {
        Text(data.title)
            .font(.title3)
    }

    private var rightButton: some View {
        Button {
            if let action = onRightButtonClicked{
                action()
            }
        } label: {
            Image(systemName:data.rightIconName)
        }
    }
}
