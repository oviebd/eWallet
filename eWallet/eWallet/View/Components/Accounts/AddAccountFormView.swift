//
//  AddAccountFormView.swift
//  eWallet
//
//  Created by Habibur Rahman on 28/2/24.
//

import SwiftUI

struct AddAccountFormView: View {
  
    @State private var name: String = ""
    @State private var currencyName: String = ""
    @State private var initialAmount: String = ""

    var body: some View {
        Form {
//            
//            Section {
//                Text("Account Name - ")
//            } header: {
//                Text("Account Name - ")
//            }

            
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

#Preview {
    Group{
        AddAccountFormView()
        
    }
   
}
