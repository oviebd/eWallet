//
//  AddCurrencyView.swift
//  eWallet
//
//  Created by Habibur Rahman on 27/5/24.
//

import SwiftUI

struct AddCurrencyView: View {
    
    @ObservedObject var vm = AddCurrencyViewModel()
    
    let topBarConfig = CommonTopBarData(title: "Add Currency", leftIconName: "chevron.left")
    
  

    var body: some View {
        VStack {
            CommonTopBar(data: topBarConfig)
                .customNavigationTitle("Second Screen")
            
            Button(action: {
                vm.createCurrency()
            }, label: {
                Text("Save")
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
                    .padding()
            })
            
            Form {
                Section {

                    HStack {
                        Text("Name - ")
                        TextField("BDT", text: $vm.title)
                    }

                    HStack {
                        Text("Symbol - ")
                        TextField("Amount", text: $vm.symbol)
                    }
                    
                    HStack {
                        Text("Short Code - ")
                        TextField("Amount", text: $vm.short_code)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    AddCurrencyView()
}
