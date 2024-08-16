//
//  HomeView.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/2/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = HomeVm()

    let topBarConfig = CommonTopBarData(title: "", bgColor: Color.theme.accountGridCardBG)

    var body: some View {
        NavigationStack {
            
            VStack(spacing:0) {
               
                CommonTopBar(data: topBarConfig)
                   // .frame(height: 50)
                    
                   

                AccountGridView { buttonType in
                    vm.onAccountListButtonPressed(buttonType: buttonType)
                }.frame(height: 300)
                
                RecordListView(){ recordItem in
                    vm.selectedRecordData = recordItem
                    vm.isCreateRecordButtonPressed = true
                }.frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .background(Color.red)
                    
                
                
                Spacer()
            }

            .popover(isPresented: $vm.isCreateAccountButtonPressed) {
                AddAccountView(includeNavigationStack: true)
            }
            .navigationDestination(isPresented: $vm.isCreateRecordButtonPressed, destination: {
                CreateRecordMainView(recordData: vm.selectedRecordData)

            })
        }
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    var floatingAddRecordButton : some View {
        HStack {
            Spacer()
            Button {
                vm.isCreateRecordButtonPressed = true
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.all, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.blue)
                    )
                    .foregroundColor(.white)
                    .shadow(color: .gray, radius: 1)
            }
        }.padding(.trailing,30)
    }
}
