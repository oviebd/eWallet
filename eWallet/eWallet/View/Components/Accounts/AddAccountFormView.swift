//
//  AddAccountFormView.swift
//  eWallet
//
//  Created by Habibur Rahman on 28/2/24.
//

import SwiftUI

struct AddAccountFormView: View {
    
    @StateObject var vm = CoreDataManagerModel()
    
    let topBarConfig = CommonTopBarData(title: "Add Account", leftIconName: "chevron.left")
    
    @State private var name: String = ""
    @State private var currencyName: String = ""
    @State private var initialAmount: String = ""

    
    
    var body: some View {
        VStack {
            CommonTopBar(data: topBarConfig)
                .customNavigationTitle("Second Screen")

            Button(action: {
                vm.addAccounts()
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
                        TextField("Enter Account Name", text: $name)
                    }

                    HStack {
                        Text("Currency Name - ")
                        TextField("BDT", text: $currencyName)
                    }

                    HStack {
                        Text("Initial Amount - ")
                        TextField("Amount", text: $currencyName)
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
