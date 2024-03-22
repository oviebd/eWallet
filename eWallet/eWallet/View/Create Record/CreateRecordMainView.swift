//
//  CreateRecordMainView.swift
//  eWallet
//
//  Created by Habibur Rahman on 20/3/24.
//

import SwiftUI

struct CreateRecordMainView: View {
    @State private var favoriteColor = "Red"

   
    
    var body: some View {
        VStack(spacing:0){
            headerView

            RecordTypeSegmentedView()
                .frame(height: 50)
            
        }
       
    }
    
  
}

#Preview {
    CreateRecordMainView()
}

extension CreateRecordMainView {
    var headerView: some View {
        HStack {
           
            Button {
            } label: {
                Image(systemName: "xmark")
            }.padding(.leading, 20)

            Spacer()
            Button {
            } label: {
                Image(systemName: "checkmark")
            }.padding(.trailing, 20)

        }.frame(height: 50)
            .foregroundColor(Color.white)
            .fontWeight(.bold)
            .background(Color.blue)
    }
}
