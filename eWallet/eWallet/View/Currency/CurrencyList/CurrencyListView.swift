//
//  CurrencyListView.swift
//  eWallet
//
//  Created by Habibur Rahman on 2/7/24.
//

import SwiftUI

struct CurrencyListView: View {
    @Environment(\.presentationMode) var presentationMode
    let topBarConfig = CommonTopBarData(title: "Currency List", leftIconName: "chevron.left", rightIconName: "plus.circle.fill")

    @StateObject var vm = CurrencyListVM()

    var body: some View {
        VStack {
            CommonTopBar(data: topBarConfig,
                         onLeftButtonClicked: {
                             self.presentationMode.wrappedValue.dismiss()
                         },
                         onRightButtonClicked: {
                             vm.isAddCurrencyPressed = true
                         })

            ScrollView{
                ForEach(vm.currencyDatas) { item in
                    SingleCurrencyListItem(currencyData: item)
                }
            }
           

            Spacer()
        }

        .navigationDestination(isPresented: $vm.isAddCurrencyPressed, destination: {
            AddCurrencyView()

        })

        .navigationBarHidden(true)
    }
}

#Preview {
    CurrencyListView()
}
