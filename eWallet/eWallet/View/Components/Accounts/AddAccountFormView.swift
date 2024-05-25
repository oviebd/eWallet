//
//  AddAccountFormView.swift
//  eWallet
//
//  Created by Habibur Rahman on 28/2/24.
//

import SwiftUI

struct AddAccountFormView: View {
    
    let topBarConfig = CommonTopBarData(title: "Add Account", leftIconName: "chevron.left")
    
    @State private var name: String = ""
    @State private var currencyName: String = ""
    @State private var initialAmount: String = ""

    
    
    var body: some View {
        VStack {
            CommonTopBar(data: topBarConfig)
                .customNavigationTitle("Second Screen")

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
