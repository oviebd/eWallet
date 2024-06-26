//
//  AddAccountFormView.swift
//  eWallet
//
//  Created by Habibur Rahman on 28/2/24.
//

import SwiftUI

struct AddAccountView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm = AddAccountVM()
    @State var currencyName: String?
    @State var selectedIndex: Int = 0

    let topBarConfig = CommonTopBarData(title: "Add Account", leftIconName: "xmark", rightIconName: "checkmark")

    var body: some View {
        
        ZStack{
            VStack {
                CommonTopBar(data: topBarConfig,
                             onLeftButtonClicked: {
                                 self.presentationMode.wrappedValue.dismiss()
                             },
                             onRightButtonClicked: {
                                 vm.createAccount()
                             })

                Form {
                    Section {
                        HStack {
                            Text("Account Name - ")
                            TextField("Enter Account Name", text: $vm.name)
                        }

                        HStack {
                            Text("Select Currency - ")

                            if vm.currencyNamesList.count > 0{
                                CommonDropdownView(dropdownOptions: vm.currencyNamesList, selectedOptionIndex: $selectedIndex)
                            }else{
                                Button{
                                    
                                }label: {
                                    Text("Add Ctegory") 
                                }
                            }
                           
                        }

                        HStack {
                            Text("Initial Amount - ")
                            TextField("Amount", text: $vm.initialAmount)
                        }
                    }
                }
            }
            
            
            if vm.showingAlert {
                CustomAlertView(presentAlert: $vm.showingAlert, alertData: vm.alertModel,positiveButtonAction: {
                   
                    if vm.isAccountCreated {
                        vm.resetValues()
                    }
                    
                }, negativeButtonAction: {
                    if vm.isAccountCreated {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                })
            }
        }
        
       
        .navigationBarHidden(true)
        
        
    }
}

#Preview {
    Group {
        AddAccountView()
    }
}
