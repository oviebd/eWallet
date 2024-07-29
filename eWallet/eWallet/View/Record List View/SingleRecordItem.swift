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
        HStack (alignment: .center) {
            
            SingleCircleItem(imageName: recordData.catagory?.iconImage ?? "folder.fill", color:  recordData.catagory?.color ?? Color.gray)
                .padding(.leading,10)
                .padding(.trailing,5)
    
            
            VStack(alignment: .leading, spacing: 0) {
                Text(recordData.catagory?.title ?? "")
                    .foregroundStyle(.black.opacity(0.9))
                    .lineLimit(1)
                
                Text(recordData.account?.title ?? "")
                    .font(.caption)
                    .foregroundStyle(.black.opacity(0.5))
                    .lineLimit(1)
                
                Text(recordData.note)
                    .font(.caption)
                    .italic()
                    .foregroundStyle(.black.opacity(0.6))
                    .lineLimit(1)
            }
           
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(recordData.amount.toAmountTextWithCurrency(currency: recordData.account?.currencyData))
                    .font(.subheadline)
                   .fontWeight(.semibold)
                   .foregroundStyle(.darkRed)
                   .lineLimit(1)
                
                
//                Text("(BDT 19700.00)")
//                    .font(.caption2)
//                    .foregroundStyle(.green)
//                
                Text(recordData.date.asShortDateString())
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .lineLimit(1)
                
                
            }.padding(.trailing, 10)
               
        }
       
    }
}

#Preview {
    SingleRecordItem(recordData: DummyDataUtils.dummyRecordData)
}
