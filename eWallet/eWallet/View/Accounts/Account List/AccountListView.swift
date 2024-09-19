//
//  AccountListView.swift
//  eWallet
//
//  Created by Habibur Rahman on 24/3/24.
//

import SwiftUI

struct AccountListView : View {
    
    @Environment(\.presentationMode) var presentationMode
    
    private let topBarConfig = CommonTopBarData(title: "Choose Account", leftIconName: "chevron.left", rightIconName: "plus.circle.fill")
   
    @Binding var selectedAccountData : AccountData?
    @StateObject private var vm = AccountListVM()
    @State var isPopupView : Bool = false
    
    var body: some View {
        
        if isPopupView {
            NavigationStack {
                contet
            }
        }else{
            contet
        }
    }
}

#Preview {
    AccountListView( selectedAccountData: .constant(nil))
}

extension AccountListView {
    var contet : some View {
        VStack(spacing: 20) {
            CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                self.presentationMode.wrappedValue.dismiss()
            },onRightButtonClicked: {
                vm.isAddAccountPressed = true
            })

            VStack(spacing: 15) {
                ForEach(vm.accountList) { data in
                    ChooseAccountItemView(accountData: data)
                        .onTapGesture {
                            selectedAccountData = data
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    Rectangle()
                        .fill(Color.theme.secondaryText.opacity(0.3))
                        .frame(height: 0.5)
                }
            }

            Spacer()
        }
        .background(Color.theme.white)
        .navigationDestination(isPresented: $vm.isAddAccountPressed, destination: {
            AddAccountView(includeNavigationStack: false)

        })

        .navigationBarHidden(true)
    }
}
