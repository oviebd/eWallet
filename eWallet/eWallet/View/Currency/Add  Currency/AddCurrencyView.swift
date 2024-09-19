//
//  AddCurrencyView.swift
//  eWallet
//
//  Created by Habibur Rahman on 27/5/24.
//

import SwiftUI

struct AddCurrencyView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm = AddCurrencyViewModel()

    let topBarConfig = CommonTopBarData(title: "Add Currency", leftIconName: "chevron.left",rightIconName: "checkmark")
  

    var body: some View {
        ZStack{
            VStack {
                CommonTopBar(data: topBarConfig,
                             onLeftButtonClicked: {
                                self.presentationMode.wrappedValue.dismiss()
                             },
                             onRightButtonClicked: {
                                 vm.createCurrency()
                             })

                Form {
                    Section {
                        HStack {
                            Text("Name - ")
                            TextField("BDT", text: $vm.title)
                        }

                        HStack {
                            Text("Symbol - ")
                            TextField("Symbol", text: $vm.symbol)
                        }

                        HStack {
                            Text("Short Code - ")
                            TextField("Code", text: $vm.short_code)
                        }
                    }
                }
            }
            
            if vm.showingAlert {
                CustomAlertView(presentAlert: $vm.showingAlert, alertData: vm.alertModel,positiveButtonAction: {
                   
                    if vm.isCreated {
                        vm.resetValues()
                    }
                    
                }, negativeButtonAction: {
                    if vm.isCreated {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                })
            }
        }
        
        .navigationBarHidden(true)

    }
}

#Preview {
    AddCurrencyView()
}
