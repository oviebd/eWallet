//
//  RecordListItem.swift
//  eWallet
//
//  Created by Habibur Rahman on 13/5/24.
//

import SwiftUI

struct RecordListView: View {
    //let recordLists = RecordDataUtility().recordList

    @StateObject var vm = RecordListVM()
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                ForEach(vm.recordsList) { item in
                    SingleRecordItem(recordData: item)
                }
                
            }
        }
    }
}

#Preview {
    RecordListView()
}
