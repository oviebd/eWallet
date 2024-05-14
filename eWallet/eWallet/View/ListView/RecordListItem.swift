//
//  RecordListItem.swift
//  eWallet
//
//  Created by Habibur Rahman on 13/5/24.
//

import SwiftUI

struct RecordListItem: View {
    let recordLists = RecordDataUtility().recordList

    var body: some View {
        
        ScrollView {
            
            VStack {
                ForEach(recordLists) { recordListDataModel in

                      RecordHeaderView(recordListDataModel: recordListDataModel)

                    ForEach(recordListDataModel.dataList) { recordData in
                        SingleRecordItem(recordData: recordData)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    RecordListItem()
}
