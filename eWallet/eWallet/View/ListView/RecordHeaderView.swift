//
//  RecordHeaderView.swift
//  eWallet
//
//  Created by Habibur Rahman on 14/5/24.
//

import SwiftUI

struct RecordHeaderView: View {
    var recordListDataModel: RecordListDataModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(recordListDataModel.title)
                    .font(.subheadline)
                
                
                Text(recordListDataModel.balance)
                    .font(.caption)
                    .foregroundStyle(.black.opacity(0.5))
                    
            }
            
            Spacer()
            
            Text(recordListDataModel.totalExpense)
                .font(.subheadline)
                .padding(.top)
            
        }.padding(15)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 50)
        .background(Color.gray.opacity(0.2))
    }
}

#Preview {
    RecordHeaderView(recordListDataModel: RecordDataUtility().recordList[0])
}
