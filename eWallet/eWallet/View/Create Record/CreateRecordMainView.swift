//
//  CreateRecordMainView.swift
//  eWallet
//
//  Created by Habibur Rahman on 20/3/24.
//

import SwiftUI

struct CreateRecordMainView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm  = CreateRecordVM()
 
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

                CalculatorView(calculatedValue: $vm.amountInput)

                Spacer()
            }
        }
        .navigationBarHidden(true)

        .popover(isPresented: $vm.isSelectCategoryPressed) {
            SelectCatagoryView(selectedCategory: $vm.selectedCategoryData)
        }
        .popover(isPresented: $vm.isAccountTypePressed) {
            AccountListView(selectedAccountData: $vm.selectedAccountData, isPopupView: true)
        }
        .popover(isPresented: $vm.isDetailsBtnPressed) {
            AddRecordDetailsView(additionalRecordData: $vm.additionalRecordData)
        }
    }
}

#Preview {
    CreateRecordMainView()
}

extension CreateRecordMainView {
    var headerView: some View {
        HStack {
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
            }.padding(.leading, 20)

            Spacer()
            Button {
               
                vm.onSaveBtnPressed()
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
                        vm.isAccountTypePressed = true
                    }
                Spacer()
                categoryTypeView
                    .onTapGesture {
                        vm.isSelectCategoryPressed = true
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

            TextField("0", text: $vm.amountInput)
                .multilineTextAlignment(.trailing)
                .font(.system(size: 70))
                .minimumScaleFactor(0.01)
                .fontWeight(.semibold)

            Text("BDT")
                .font(.system(size: 20))
                .offset(x: 0, y: -10)
                .padding(.leading, 10)
                .fontWeight(.medium)
                .padding(.trailing, 10)

            Button {
                vm.isDetailsBtnPressed = true
            } label: {
                Text(">")
                    .padding(.vertical, 15)
                    .padding(.horizontal, 10)
                    .background(RoundedRectangle(cornerRadius: 10.0, style: .continuous).fill(Color.white))
                    .foregroundStyle(Color.black)
            }.padding(.trailing,10)

        }.foregroundColor(Color.theme.primaryText)
    }

    var accountTypeView: some View {
        VStack {
            Text("Account")
                .foregroundStyle(Color.theme.white.opacity(0.5))
                .font(.system(size: 12))
            Text(vm.selectedAccountData?.title ?? "Select")
                .foregroundStyle(Color.theme.primaryText)
                .font(.system(size: 15))
                .fontWeight(.semibold)
        }.frame(alignment: .center)
    }

    var categoryTypeView: some View {
        VStack {
            Text("Category")
                .foregroundStyle(Color.theme.white.opacity(0.5))
                .font(.system(size: 12))
            Text(vm.selectedCategoryData?.title ?? "Select")
                .foregroundStyle(Color.theme.primaryText)
                .font(.system(size: 15))
                .fontWeight(.semibold)
        }.frame(alignment: .center)
    }
}
