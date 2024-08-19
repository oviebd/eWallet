//
//  HomeView.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/2/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = HomeVm()

    let topBarConfig = CommonTopBarData(title: "dasf", bgColor: Color.theme.accountGridCardBG)

    var body: some View {
        NavigationStack {
            
            VStack(spacing:0) {
               
                CommonTopBar(data: topBarConfig)
                   // .frame(height: 50)
                    

                AccountGridView(onAddButtonPressed: { 
                    vm.isCreateAccountButtonPressed = true
                },
                onAccountItemPressed: {_ in})


                RecordListView(){ recordItem in
                    vm.selectedRecordData = recordItem
                    vm.isCreateRecordButtonPressed = true
                }
                .padding(.horizontal,20)
                .offset(y: -40)
                    
                Spacer()
                
                floatingAddRecordButton
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
