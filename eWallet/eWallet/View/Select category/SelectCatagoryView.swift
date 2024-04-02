//
//  SelectCatagoryItems.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

struct SelectCatagoryView: View {
    @Binding public var isViewShowing: Bool
    private let topBarConfig = CommonTopBarData(title: "Select Category", bgColor: Color.theme.darkBlue, leftIconName: "chevron.left", rightIconName: "")

    var body: some View {
      
        VStack(spacing: 0) {
            CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                print("Left Btn Pressed")
                isViewShowing = false

            })

            ScrollView {
                VStack(alignment: .leading) {
                    Text("MOST FREQUENT")
                        .padding(.leading, 5)

                    RecentCatagoryItem()

                    Text("All CATAGORIES")
                        .padding(.leading, 5)
                    AllCatagoryItem()
                        .padding(.leading, 10)
                }
            }

        }.background(Color.white)
    }
}

#Preview {
    SelectCatagoryView(isViewShowing: .constant(true))
}
