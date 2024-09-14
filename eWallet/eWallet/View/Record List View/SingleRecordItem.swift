//
//  SingleRecordItem.swift
//  eWallet
//
//  Created by Habibur Rahman on 13/5/24.
//

import SwiftUI

enum SingleRecordItemType{
    case Normal
    case GroupedByDate
}

struct SingleRecordItem: View {
 
    var recordData : RecordData
    var itemType : SingleRecordItemType = .Normal
   
    var body: some View {
        HStack (alignment: .top) {
            
            Image(systemName: recordData.catagory?.iconImage ?? "folder.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(10)
                .WithDefaultCircularBgModifier(bgColor: recordData.catagory?.color ?? Color.gray)
                .foregroundStyle(Color.white)
               

    
            VStack(alignment: .leading, spacing: 0) {
                Text(recordData.catagory?.title ?? "")
                    .font(.system(size: 16))
                    .foregroundStyle(.black.opacity(0.9))
                    .lineLimit(1)
                
                Text(recordData.account?.title ?? "")
                    .font(.system(size: 12))
                    .foregroundStyle(.black.opacity(0.5))
                    .lineLimit(1)
                
                Text(recordData.note)
                    .font(.system(size: 12))
                    .foregroundStyle(.black.opacity(0.6))
                    .lineLimit(1)
            } .padding(.leading,2)
           
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 3) {
                Text(recordData.amount.toAmountTextWithCurrency(currency: recordData.account?.currencyData))
                    .font(.system(size: 12))
                   .fontWeight(.semibold)
                   .foregroundStyle(getAmountTextColor())
                   .lineLimit(1)
                

                Text(getDateTitle())
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
                    .lineLimit(1)
            }
            .padding(.top,3)
               
        }
       
    }
    
    func getDateTitle() -> String{
        if itemType == .Normal {
            return recordData.date.toReadableDateString()
        }
        return recordData.date.toReadableTimeString()
    }
    
    func getAmountTextColor() -> Color{
        let recordType = RecordTypeEnum(rawValue: recordData.recordType)
        if recordType == .INCOME {
            return Color.theme.accountGridCardBG
        }
        return Color.theme.darkRed
    }
}

#Preview {
    SingleRecordItem(recordData: DummyDataUtils.dummyRecordData_Expense)
}
