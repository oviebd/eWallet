//
//  AddAccountFormView.swift
//  eWallet
//
//  Created by Habibur Rahman on 28/2/24.
//

import SwiftUI

struct AddAccountView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm = AddAccountVM()
    let topBarConfig = CommonTopBarData(title: "Add Account", leftIconName: "xmark", rightIconName: "checkmark")
    
    @State var includeNavigationStack : Bool

    var body: some View {
        
        if includeNavigationStack {
            NavigationStack{
               content
            }
        }else{
           content
        }
        
    }
}

#Preview {
    Group {
        AddAccountView(includeNavigationStack: true)
    }
}

extension AddAccountView {
    
    var content : some View {
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
                                .font(.title3)
                            TextField("Enter Account Name", text: $vm.name)
                        }

                        HStack {
                            Text("Currency - ")
                                .font(.title3)
                            Spacer()
                            
                            Button{
                                vm.isAddCurrencyPressed = true
                            }label: {
                                HStack{
                                    Text(vm.selectedCurrency?.title ?? "Required")
                                    Image(systemName: "chevron.compact.right")
                                        .resizable()
                                        .frame(width: 8, height: 10)
                                }.font(.subheadline)
                            }
                           
                        }

                        HStack {
                            Text("Amount - ")
                            Spacer()
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
        } .background(Color.theme.white)
        
        .navigationDestination(isPresented: $vm.isAddCurrencyPressed, destination: {
            CurrencyListView(selectedCurrency: $vm.selectedCurrency)

        })
        .navigationBarHidden(true)
    }
    
}
