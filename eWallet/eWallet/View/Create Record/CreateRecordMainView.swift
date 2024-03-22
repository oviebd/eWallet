//
//  CreateRecordMainView.swift
//  eWallet
//
//  Created by Habibur Rahman on 20/3/24.
//

import SwiftUI

struct CreateRecordMainView: View {
    @State private var favoriteColor = "Red"
    @State private var amountInput = "0"
   
    
    var body: some View {
        VStack(spacing:0){
            headerView
                .shadow(color: Color.theme.shadowColor.opacity(1), radius: 4, x: 0, y: 5)

            RecordTypeSegmentedView()
                .frame(height: 50)
           
            Rectangle()
               
                .fill(Color.theme.shadowColor.opacity(1))
                .shadow(color: Color.theme.darkBlue.opacity(1), radius: 4, x: 0, y: 0)
                .frame(height: 1)
            
                
               
            VStack{
                HStack{
                    Text("-")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    TextField("0", text: $amountInput)
                        .multilineTextAlignment(.trailing)
                        .font(.system(size: 70))
                        .minimumScaleFactor(0.01)
                        .fontWeight(.semibold)
                    
                    Text("BDT")
                        .font(.system(size: 20))
                        .offset(x: 0, y: -10)
                        .padding(.leading,10)
                        .fontWeight(.medium)
  
                }.foregroundColor(Color.theme.primaryText)
                    .padding(.leading,15)
                
                
            }.frame(height: 250)
            .background(Color.theme.normalBlue)
            
                
//            Rectangle()
//                .fill(Color.theme.normalBlue)
//                .frame(height: 250)
//               // .shadow(color: Color.theme.shadowColor.opacity(1), radius: 2, x: 0, y: 2)
            
            
            Spacer()
            
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
            .background(Color.theme.mediumDarkBlue)
    }
}
