//
//  AddAccountFormView.swift
//  eWallet
//
//  Created by Habibur Rahman on 28/2/24.
//

import SwiftUI

struct AddAccountFormView: View {
    @State private var name: String = ""

    @State private var selection = "Red"
    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]

    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Account Name - ")
                    TextField("Enter Account Name", text: $name)
                }
                
                
                HStack {
                    Text("Currency Name - ")
                    TextField("BDT", text: $name)
                }
            }
        }
    }
}

#Preview {
    AddAccountFormView()
}
