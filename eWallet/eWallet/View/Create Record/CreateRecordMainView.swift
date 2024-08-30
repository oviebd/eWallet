//
//  CreateRecordMainView.swift
//  eWallet
//
//  Created by Habibur Rahman on 20/3/24.
//

import SwiftUI

struct CreateRecordMainView: View {
   
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm : CreateRecordVM
    @State private var favoriteColor = 0

 
    init(recordData: RecordData?) {
        _vm = StateObject(wrappedValue: CreateRecordVM(recordData: recordData))
       
       // UISegmentedControl.appearance().selectedSegmentTintColor = .blue
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }

    var body: some View {
        VStack(spacing: 0) {
            headerView
            
            VStack {
                Picker("What is your favorite color?", selection: $vm.selectedRecordType) {
                    Text(vm.recordTypes[0].rawValue).tag(RecordTypeEnum.INCOME)
                    Text(vm.recordTypes[1].rawValue).tag(RecordTypeEnum.EXPENSE)
                    Text(vm.recordTypes[2].rawValue).tag(RecordTypeEnum.TRANSFER)
                              
                       }
                       .pickerStyle(.segmented)

            }.padding(.horizontal,20)
                .background(Color.theme.accountGridCardBG)

            middleView
                .frame(height: 200)
                .background(Color.theme.accountGridCardBG)
            
            
            VStack(spacing: 0.5){
                chooseAccountFormView
                chooseAccountFormView
            }
           
            .padding(.top)
            .background(Color.gray)

          //  CalculatorView(calculatedValue: $vm.amountInput)

            Spacer()
        }
        .navigationBarHidden(true)

        .popover(isPresented: $vm.isSelectCategoryPressed) {
            SelectCatagoryView(selectedCategory: $vm.selectedCategoryData)
        }
        .popover(isPresented: $vm.isAccountTypePressed) {
            AccountListView(selectedAccountData: $vm.account, isPopupView: true)
        }
        .popover(isPresented: $vm.isFromAccountTypePressed) {
            AccountListView(selectedAccountData: $vm.fromAccount, isPopupView: true)
        }
        .popover(isPresented: $vm.isDetailsBtnPressed) {
            AddRecordDetailsView(additionalRecordData: $vm.additionalRecordData)
        }
    }
}

#Preview {
    CreateRecordMainView(recordData: nil)
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
            
            
            if vm.isEdit {
                
                Button {
                    vm.onDeletePressed()
                } label: {
                    Image(systemName: "trash")
                        .foregroundStyle(Color.red)
                }
                
                Spacer()
            }
            

            
            
            Button {
                vm.onSaveBtnPressed()
            } label: {
                Image(systemName: "checkmark")
            }.padding(.trailing, 20)

        }.frame(height: 50)
            .foregroundColor(Color.white)
            .fontWeight(.bold)
            .background(Color.theme.accountGridCardBG)
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
                if vm.selectedRecordType == .TRANSFER {
                    fromAccountView
                    Spacer()
                    accountView

                } else {
                    accountView
                    Spacer()
                    categoryTypeView
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
    }

    var addNumberView: some View {
        HStack {
            Text(vm.selectedRecordType.symbol)
                .font(.title)
                .fontWeight(.bold)

            Spacer()

            TextField("0", text: $vm.amountInput)
                .multilineTextAlignment(.trailing)
                .font(.system(size: 70))
                .minimumScaleFactor(0.01)
                .fontWeight(.semibold)
                .disabled(true)

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
            }.padding(.trailing, 10)

        }.foregroundColor(Color.theme.primaryText)
    }

    var accountView: some View {
        VStack {
            Text(vm.selectedRecordType == .TRANSFER ? "To Account" : "Account")
                .foregroundStyle(Color.theme.white.opacity(0.5))
                .font(.system(size: 12))
            Text(vm.account?.title ?? "Select")
                .foregroundStyle(Color.theme.primaryText)
                .font(.system(size: 15))
                .fontWeight(.semibold)
        }.frame(alignment: .center)
            .onTapGesture {
                vm.isAccountTypePressed = true
            }
    }

    var fromAccountView: some View {
        VStack {
            Text("From Account")
                .foregroundStyle(Color.theme.white.opacity(0.5))
                .font(.system(size: 12))
            Text(vm.fromAccount?.title ?? "Select")
                .foregroundStyle(Color.theme.primaryText)
                .font(.system(size: 15))
                .fontWeight(.semibold)
        }.frame(alignment: .center)
            .onTapGesture {
                vm.isFromAccountTypePressed = true
            }
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
            .onTapGesture {
                vm.isSelectCategoryPressed = true
            }
    }
}


extension CreateRecordMainView {
    
    var chooseAccountFormView : some View {
        
        DefaultFormPicker(iconName: "bag", mainTitle: "Account", rightTitle: "", isRequired: true)
        
//        HStack{
//            Image(systemName: "bag")
//                .resizable()
//                .frame(width: 18, height: 18)
//                .padding(10)
//                
//                .background(
//                    RoundedRectangle(cornerRadius: 9)
//                        .fill(Color.green)
//                ).foregroundStyle(Color.white)
//            
//            Text("Account")
//                .foregroundStyle(Color.theme.primaryText)
//                .font(.system(size: 18))
//                .padding(.horizontal,10)
//            
//            Spacer()
//            
//            Text("Eastern Bank")
//                .foregroundStyle(Color.theme.secondaryText)
//                .font(.system(size: 16))
//            
//            Image(systemName: "chevron.compact.right")
//                .resizable()
//                .frame(width: 7, height: 10)
//                .foregroundStyle(Color.theme.secondaryText)
//                .offset(y:1.5)
//                .padding(.leading,5)
//        }
//       
//        .padding(.horizontal,20)
//        .padding(.vertical,15)
//        .background(Color.theme.white)
//        
//        .onTapGesture {
//            vm.isAccountTypePressed = true
//        }
    }
    
}
