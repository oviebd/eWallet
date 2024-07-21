//
//  SelectCatagoryItems.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

struct SelectCatagoryView: View {
    @Environment(\.presentationMode) var presentationMode
    private let topBarConfig = CommonTopBarData(title: "Select Category", bgColor: Color.theme.darkBlue, leftIconName: "chevron.left", rightIconName: "")

    @StateObject private var vm = CategoryListVm()
    @Binding var selectedCategory: CategoryData?

    var body: some View {
        VStack(spacing: 0) {
            CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                self.presentationMode.wrappedValue.dismiss()
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

                    recentCategoryView
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

                    categoryListView
                }
            }

        }.background(Color.white)
    }
}

#Preview {
    SelectCatagoryView(selectedCategory: .constant(nil))
}

extension SelectCatagoryView {
    var categoryListView: some View {
        VStack {
            ForEach(vm.categories) { item in
                Divider()
                    .background(Color.gray)

                HStack(spacing: 15) {
                    SingleCircleItem(imageName: item.iconImage, color: item.color)
                    Text(item.title)
                        .font(.subheadline)
                    Spacer()
                }.padding(.horizontal, 10)
                    .onTapGesture {
                        selectedCategory = item
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
        }
    }

    var recentCategoryView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 40) {
                ForEach(vm.recentCategories) { index in
                    VStack {
                        SingleCircleItem(imageName: index.iconImage, color: index.color)
                        Text(index.title)
                            .font(.subheadline)

                    }.padding(.horizontal, 4)
                        .onTapGesture {
                            selectedCategory = index
                            self.presentationMode.wrappedValue.dismiss()
                        }
                }

            }.padding(.leading, 10)
        }
    }
}
