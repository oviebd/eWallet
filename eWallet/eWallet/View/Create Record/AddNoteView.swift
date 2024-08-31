//
//  AddNoteView.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/8/24.
//

import SwiftUI

struct AddNoteView: View {
    
    @Environment(\.presentationMode) var presentationMode
    private let topBarConfig = CommonTopBarData(title: "Add Note",leftIconName: leftIconName)
    
    @Binding var note : String
   
    
    var body: some View {
        CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
          //  vm.prepareRecordDetailsData()
            self.presentationMode.wrappedValue.dismiss()
        })
        VStack(spacing: 10) {
            
           
            Text("Note")
                .font(.system(size: 20))
                .foregroundColor(Color.theme.secondaryText)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top,30)

            
            TextEditor(text: $note)
                .font(.system(size: 25))
                .foregroundStyle(Color.theme.primaryText)
                .multilineTextAlignment(.center)
                .lineLimit(0)
            
            Spacer()
          
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding()
    }
}

#Preview {
    AddNoteView(note: .constant(""))
}
