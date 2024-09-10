//
//  DateWiseRecordListItem.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/8/24.
//

import SwiftUI

struct DateWiseRecordListItem: View {
    let date: Date
    let dataList: [RecordData]

    var body: some View {
        VStack(alignment: .leading) {
            Text(date.toReadableDateString())
                .font(.system(size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color.theme.secondaryText)
                .padding(.top, 20)
                .padding(.bottom, 15)
                .padding(.horizontal, 20)

          
            ForEach(0 ..<  dataList.count,  id: \.self) { i in
                let data = dataList[i]
                let isLastItem = i == dataList.count - 1
            
                SingleRecordItem(recordData: data, itemType: .GroupedByDate)
                    .padding(.horizontal, 20)
                    .padding(.bottom, isLastItem ? 20 : 0)

                if !isLastItem {
                    DefaultDividerView()
                        .padding(.vertical, 5)
                }
            }

        }.background(Color.theme.white
            .shadow(color: Color.theme.gray.opacity(0.5), radius: 5))
    }

    
}

#Preview {
    DateWiseRecordListItem(date: .now, dataList: DummyDataUtils.todayRecordList)
}
