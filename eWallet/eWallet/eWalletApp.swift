//
//  eWalletApp.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/2/24.
//

import SwiftUI

@main
struct eWalletApp: App {
    @State var select : String?
    var body: some Scene {
        WindowGroup {
            //HomeView()
         //  AddCurrencyView()
            AddAccountFormView()
            //DropDownView(title: "title", prompt: "Select", options: ["Item 01", "Item 02", "item 03"], selection: $select)
            
//            CustomNavView {
//
//            }
            
          
        }
    }
}
