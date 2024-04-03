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
                VStack(alignment: .leading, spacing: 0) {
                    Text("MOST FREQUENT")
                        .font(.subheadline)
                        .padding()
                        .foregroundStyle(.black.opacity(0.5))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .background(Color.gray.opacity(0.2))

                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
                        .frame(height: 1)

                    RecentCatagoryItem()
                        .frame(height: 150)
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
                        .frame(height: 1)

                    Text("All CATAGORIES")
                        .font(.subheadline)
                        .padding()
                        .foregroundStyle(.black.opacity(0.5))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .background(Color.gray.opacity(0.2))

                    AllCatagoryItem()
                       
                }
            }

        }.background(Color.white)
    }
}

#Preview {
    SelectCatagoryView(isViewShowing: .constant(true))
}
