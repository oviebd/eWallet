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

    @Binding var additionalRecordData : AdditionalRecordData

    
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

                    
                    DatePicker("Date and Time Picker",
                               selection: $additionalRecordData.date, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle())
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
            Spacer()
        }
        .background(Color.white)
    }
}

#Preview {
    AddRecordDetailsView(additionalRecordData: .constant(DummyDataUtils.dummyRecordDetailsData))
}
