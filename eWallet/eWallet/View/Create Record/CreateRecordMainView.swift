//
//  CreateRecordMainView.swift
//  eWallet
//
//  Created by Habibur Rahman on 20/3/24.
//

import SwiftUI

struct CreateRecordMainView: View {
    @State private var favoriteColor = "Red"
    @State private var amountInput = "0"

    @State var isAccountTypePressed = false
    @State var shouldShowSelectAccountView = false

    @State var isSelectCategoryPressed = false
    @State var shouldShowSelectCategoryView = false
    
    @State var isDetailsBtnPressed = false
    @State var shouldShowDetailsView = false

    var navigations = ["selectAccount"]

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                headerView
                    .shadow(color: Color.theme.shadowColor.opacity(1), radius: 4, x: 0, y: 5)

                RecordTypeSegmentedView()
                    .frame(height: 50)

                Rectangle()
                    .fill(Color.theme.shadowColor.opacity(1))
                    .shadow(color: Color.theme.darkBlue.opacity(1), radius: 4, x: 0, y: 0)
                    .frame(height: 1)

                middleView
                    .frame(height: 250)
                    .background(Color.theme.normalBlue)

                CalculatorView(calculatedValue: $amountInput)

                Spacer()
            }
            .zIndex(1.0)

            if shouldShowSelectAccountView {
                chooseAccountView
            }

            if shouldShowSelectCategoryView {
                chooseCategoryView
            }
            
            if shouldShowDetailsView {
                detailsView
            }

        }.onChange(of: isAccountTypePressed, initial: false, {
            shouldShowSelectAccountView = isAccountTypePressed
        })
        .onChange(of: isSelectCategoryPressed, initial: false, {
            shouldShowSelectCategoryView = isSelectCategoryPressed
        })
        .onChange(of: isDetailsBtnPressed, initial: false, {
            shouldShowDetailsView = isDetailsBtnPressed
        })
        .animation(.easeInOut(duration: 0.3), value: shouldShowSelectAccountView)
        .animation(.easeInOut(duration: 0.3), value: shouldShowSelectCategoryView)
        .animation(.easeInOut(duration: 0.3), value: shouldShowDetailsView)
    }
}

#Preview {
    CreateRecordMainView()
}

extension CreateRecordMainView {
    var headerView: some View {
        HStack {
            Button {
            } label: {
                Image(systemName: "xmark")
            }.padding(.leading, 20)

            Spacer()
            Button {
            } label: {
                Image(systemName: "checkmark")
            }.padding(.trailing, 20)

        }.frame(height: 50)
            .foregroundColor(Color.white)
            .fontWeight(.bold)
            .background(Color.theme.mediumDarkBlue)
    }
}

extension CreateRecordMainView {
    var middleView: some View {
        VStack {
            Spacer()

            addNumberView
                .padding(.leading, 15)
            Spacer()
            HStack {
                accountTypeView
                    .onTapGesture {
                        isAccountTypePressed = true
                    }
                Spacer()
                categoryTypeView
                    .onTapGesture {
                        isSelectCategoryPressed = true
                    }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
    }

    var addNumberView: some View {
        HStack {
            Text("-")
                .font(.title)
                .fontWeight(.bold)

            Spacer()

            TextField("0", text: $amountInput)
                .multilineTextAlignment(.trailing)
                .font(.system(size: 70))
                .minimumScaleFactor(0.01)
                .fontWeight(.semibold)

            Text("BDT")
                .font(.system(size: 20))
                .offset(x: 0, y: -10)
                .padding(.leading, 10)
                .fontWeight(.medium)
                .padding(.trailing,10)
            
            Button{
                isDetailsBtnPressed = true
            }label: {
                Text(">")
                    .padding(.vertical,15)
                    .padding(.horizontal,10)
                    .background(RoundedRectangle(cornerRadius: 10.0, style: .continuous).fill(Color.white))
                    .foregroundStyle(Color.black)
                    
            }

        }.foregroundColor(Color.theme.primaryText)
    }

    var accountTypeView: some View {
        VStack {
            Text("Account")
                .foregroundStyle(Color.theme.white.opacity(0.5))
                .font(.system(size: 15))
            Text("Pocket Money")
                .foregroundStyle(Color.theme.primaryText)
                .font(.system(size: 15))
                .fontWeight(.semibold)
        }
    }

    var categoryTypeView: some View {
        VStack {
            Text("Category")
                .foregroundStyle(Color.theme.white.opacity(0.5))
                .font(.system(size: 15))
            Text("Charge, Fees")
                .foregroundStyle(Color.theme.primaryText)
                .font(.system(size: 15))
                .fontWeight(.semibold)
        }
    }
}

extension CreateRecordMainView {
    var chooseAccountView: some View {
        ChooseAccountView(isViewShowing: $isAccountTypePressed)
            .zIndex(2.0)
            .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
    }

    var chooseCategoryView: some View {
        SelectCatagoryView(isViewShowing: $isSelectCategoryPressed)
            .zIndex(2.0)
            .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
    }
    
    var detailsView: some View {
        AddRecordDetailsView(isViewShowing: $isDetailsBtnPressed)//(isViewShowing: $isSelectCategoryPressed)
            .zIndex(2.0)
            .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
    }
}
