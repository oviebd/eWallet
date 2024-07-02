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
    @State var currencyName: String?
    @State var selectedIndex: Int = 0

    let topBarConfig = CommonTopBarData(title: "Add Account", leftIconName: "xmark", rightIconName: "checkmark")

    var body: some View {
        
        NavigationStack{
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
                                Text("Currency ")
                                    .font(.title3)
                                Spacer()
                                
                                Button{
                                    vm.isAddCurrencyPressed = true
                                }label: {
                                    HStack{
                                        Text("Required")
                                        Image(systemName: "chevron.compact.right")
                                            .resizable()
                                            .frame(width: 8, height: 10)
                                    }.font(.subheadline)
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
            
            .navigationDestination(isPresented: $vm.isAddCurrencyPressed, destination: {
                CurrencyListView()

            })
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    Group {
        AddAccountView()
    }
}
