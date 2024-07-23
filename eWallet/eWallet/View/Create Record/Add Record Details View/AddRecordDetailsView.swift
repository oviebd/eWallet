//
//  AddRecordDetailsView.swift
//  eWallet
//
//  Created by Habibur Rahman on 27/3/24.
//

import SwiftUI

struct AddRecordDetailsView: View {
  
    @Environment(\.presentationMode) var presentationMode
    private let topBarConfig = CommonTopBarData(title: "Add Record", bgColor: Color.theme.darkBlue, leftIconName: "chevron.left", rightIconName: "")


   // @StateObject var vm : AddRecordDetailsVM = AddRecordDetailsVM()
    @Binding var additionalRecordData : AdditionalRecordData
    
//    init(additionalRecordData : AdditionalRecordData?){
//        _vm = StateObject(wrappedValue: AddRecordDetailsVM(additionalRecordData: additionalRecordData))
//       // additionalRecordData = additionalRecordData
//    }
    
    var body: some View {
        VStack(spacing: 0) {
            CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
              //  vm.prepareRecordDetailsData()
                self.presentationMode.wrappedValue.dismiss()
            })
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Note")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .opacity(1.0)

                TextField("write Note",text: $additionalRecordData.note)
                    .font(.title2)
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

                    DatePicker("Enter a date", selection: $additionalRecordData.date, displayedComponents: .date)
                        .labelsHidden()
                }
                Spacer()

                VStack(alignment: .leading) {
                    Text("Time")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .opacity(0.8)

                    DatePicker("Enter a time", selection: $additionalRecordData.time, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
            }
            .padding(.horizontal)
//            Divider()
//                .padding()

//            VStack(spacing: 15) {
//                DropDownView(title: "Payment Type", prompt: "Cash", options: payment, selection: $selectedPayment)
//
//                Divider()
//                    .padding()
//
//                DropDownView(title: "Status", prompt: "Cleared", options: status, selection: $selectedStatus)
//
//                Divider()
//                    .padding()
//            }
            Spacer()
        }
        .background(Color.white)
    }
}

#Preview {
    AddRecordDetailsView(additionalRecordData: .constant(DummyDataUtils.dummyRecordDetailsData))
}
