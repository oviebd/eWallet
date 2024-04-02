//
//  AddRecordDetailsView.swift
//  eWallet
//
//  Created by Habibur Rahman on 27/3/24.
//

import SwiftUI

struct AddRecordDetailsView: View {
    
    @Binding public var isViewShowing: Bool
    private let topBarConfig = CommonTopBarData(title: "Select Category", bgColor: Color.theme.darkBlue, leftIconName: "chevron.left", rightIconName: "")
    
    let payment = ["Cash", "Debit Card", "Bank transfer", "Mobile payment", "Web payment"]

    let warranty = ["1 year", "2 year", "3 year"]

    let status = ["Reconciled", "Cleared", "Uncleared"]

    @State var selectedPayment: String?
    @State var selectedWarranty: String?
    @State var selectedStatus: String?
    @State var wakeUp = Date.now

    var body: some View {
        
        VStack(spacing:0){
            VStack(alignment: .leading) {
                
                CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                    print("Left Btn Pressed")
                    isViewShowing = false

                })
                
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
            
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Date")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .opacity(0.8)
                    
                    DatePicker("Enter a date", selection: $wakeUp, displayedComponents: .date)
                        .labelsHidden()
                    
                }
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Time")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .opacity(0.8)
                    
                    DatePicker("Enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        
                }
            }
            .padding(.horizontal)
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
        .background(Color.white)
        
        
    }
  
}

#Preview {
    AddRecordDetailsView(isViewShowing: .constant(false))
}
