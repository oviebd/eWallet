//
//  HomeView.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/2/24.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var vm = HomeVm()
 
    let topBarConfig = CommonTopBarData(title: "Home")
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .top) {
                VStack {
                    
                    CommonTopBar(data: topBarConfig)
                    
                    AccountsListView { buttonType in
                    vm.onAccountListButtonPressed(buttonType: buttonType)
                    }
                    Spacer()
                }

            }.background(RoundedRectangle(cornerRadius: 15)
                .fill(.cyan)
                .frame(width: 200, height: 50)
            )
            .navigationDestination(isPresented: $vm.isCreateAccountButtonPressed, destination: {
                AddAccountFormView()

            })
        }
        
        
        
        //.background(Color.white)

        // Spacer()
    }
    
        
}

#Preview {
    HomeView()
}
