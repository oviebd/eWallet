//
//  AddRecordDetailsView.swift
//  eWallet
//
//  Created by Habibur Rahman on 27/3/24.
//

import SwiftUI

struct AddRecordDetailsView: View {
    let payment = ["Cash", "Debit Card", "Bank transfer", "Mobile payment", "Web payment"]

    let warranty = ["1 year", "2 year", "3 year"]

    let status = ["Reconciled", "Cleared", "Uncleared"]

    @State var selectedPayment: String?
    @State var selectedWarranty: String?
    @State var selectedStatus: String?

    var body: some View {
        VStack(alignment: .leading) {
            Text("Note")
                .font(.footnote)
                .foregroundColor(.gray)
                .opacity(0.8)

            Text("Description")
                .font(.title3)
                .foregroundStyle(.black)
                .opacity(0.6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()

        Divider()
            .padding()
        
        

        VStack(spacing: 15) {
            DropDownView(title: "Payment Type", prompt: "Cash", options: payment, selection: $selectedPayment)

            Divider()
                .padding()

            DropDownView(title: "Status", prompt: "Cleared", options: status, selection: $selectedStatus)

            Divider()
                .padding()
        }
        Spacer()
    }
  
}

#Preview {
    AddRecordDetailsView()
}
