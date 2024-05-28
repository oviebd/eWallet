//
//  AddAccountFormView.swift
//  eWallet
//
//  Created by Habibur Rahman on 28/2/24.
//

import SwiftUI

struct AddAccountFormView: View {
    
    @ObservedObject var vm = AccountViewModel()
    @State var currencyName: String?
    
     
    
    let topBarConfig = CommonTopBarData(title: "Add Account", leftIconName: "chevron.left")
    
    
    var body: some View {
        VStack {
            CommonTopBar(data: topBarConfig)
                .customNavigationTitle("Second Screen")

            Button(action: {
                vm.createAccount()
            }, label: {
                Text("Save")
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
                    .padding()
            })
            
            Form {
                Section {
                    HStack {
                        Text("Account Name - ")
                        TextField("Enter Account Name", text: $vm.name)
                    }

                    HStack {
                      //  Text("Currency Name - ")

                        DropDownView(title: "", prompt: "Currency Name", options: vm.currencyNamesList , selection: $currencyName)

                        //TextField("BDT", text: $vm.currencyName)
                    }

                    HStack {
                        Text("Initial Amount - ")
                        TextField("Amount", text: $vm.initialAmount)
                    }
                }
            }
        }
    }
}

#Preview {
    Group {
        AddAccountFormView()
    }
}
