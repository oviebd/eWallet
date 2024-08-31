//
//  AllRecordsView.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/8/24.
//

import SwiftUI

struct AllRecordsView: View {
    @Environment(\.presentationMode) var presentationMode
    private let topBarConfig = CommonTopBarData(title: "Records",leftIconName: "xmark")
    
    var body: some View {
        CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
            //  vm.prepareRecordDetailsData()
            self.presentationMode.wrappedValue.dismiss()
        })
   
        .navigationBarHidden(true)
    }
}

#Preview {
    AllRecordsView()
}
