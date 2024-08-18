//
//  RecordListItem.swift
//  eWallet
//
//  Created by Habibur Rahman on 13/5/24.
//

import SwiftUI

struct RecordListView: View {
    // let recordLists = RecordDataUtility().recordList

    @StateObject var vm = RecordListVM()

    var onItemPresesd: (RecordData) -> Void
    var body: some View {
        VStack {
            ForEach(vm.recordsList) { item in
                SingleRecordItem(recordData: item)
                    .onTapGesture {
                        onItemPresesd(item)
                    }
            }

        }.background(Color.yellow)
    }
}

#Preview {
    RecordListView { _ in
    }
}
