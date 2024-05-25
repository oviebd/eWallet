//
//  SingleRecordItem.swift
//  eWallet
//
//  Created by Habibur Rahman on 13/5/24.
//

import SwiftUI

struct SingleRecordItem: View {
 
    var recordData : RecordData
   
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 50)
                    .foregroundStyle(recordData.color)
                
                Image(systemName: recordData.image)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
            }.padding()
            
            VStack(alignment: .leading, spacing: 0) {
                Text(recordData.catagory)
                    .foregroundStyle(.black.opacity(0.9))
                
                Text(recordData.accountName)
                    .font(.caption)
                    .foregroundStyle(.black.opacity(0.5))
                
                Text(recordData.shortDescription)
                    .font(.caption)
                    .italic()
                    .foregroundStyle(.black.opacity(0.6))
            }
           
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(recordData.amount)
                    .font(.subheadline)
                   .fontWeight(.semibold)
                   .foregroundStyle(.darkRed)
                
//                Text("(BDT 19700.00)")
//                    .font(.caption2)
//                    .foregroundStyle(.green)
//                
                Text(recordData.date)
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                
            }.padding(.trailing, 10)
        }
    }
}

//#Preview {
//    SingleRecordItem(recordData: RecordData(catagory: <#String#>, accountName: <#String#>, shortDescription: <#String#>, amount: <#String#>, date: <#String#>, image: <#String#>, color: <#Color#>))
//}
