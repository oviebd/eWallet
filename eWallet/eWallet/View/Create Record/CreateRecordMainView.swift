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

    var navigations = ["selectAccount"]

    var body: some View {
        
        ZStack{
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
            
            if isAccountTypePressed {
                ChooseAccountView(isViewShowing: $isAccountTypePressed)
                    .transition(.move(edge: .bottom))
                   
                   // .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
                   
            }
            
        }
        .animation(.easeInOut(duration: 1),value: isAccountTypePressed)
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
//                CustomNavLink(destination:
//                    ChooseAccountView(), label: {
//                        accountTypeView
//                    })

//                NavigationLink(value: navigations[0]) {
//                    accountTypeView
//                }
                accountTypeView
                Spacer()
                categoryTypeView
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
        .onTapGesture {
            isAccountTypePressed = true
//            withAnimation(.easeInOut(duration: 1)) {
//                isAccountTypePressed = true
//            }
        }
    }

    var categoryTypeView: some View {
        VStack {
            Text("Categody")
                .foregroundStyle(Color.theme.white.opacity(0.5))
                .font(.system(size: 15))
            Text("Charge, Fees")
                .foregroundStyle(Color.theme.primaryText)
                .font(.system(size: 15))
                .fontWeight(.semibold)
        }
    }
}
