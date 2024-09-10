//
//  HomeView.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/2/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeVm()

    let topBarConfig = CommonTopBarData(title: "", bgColor: Color.theme.accountGridCardBG, leftIconName: "")

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                CommonTopBar(data: topBarConfig)
                ScrollView {
                    VStack(spacing: 0) {
                        AccountGridView(onAddButtonPressed: {
                                            vm.isCreateAccountButtonPressed = true
                                        },
                                        onAccountItemPressed: { _ in })

                        RecordListView(onShowMorePressed: {
                            vm.onPressedShowMoreFromList = true
                        }) { recordItem in
                            vm.selectedRecordData = recordItem
                            vm.isCreateRecordButtonPressed = true
                        }
                        .padding(.horizontal, 20)
                        .offset(y: -40)
                        
                        ExpensePieChartView()
                            .padding(.horizontal, 20)

                        Spacer()

                        floatingAddRecordButton
                    }
                }
            }

            .popover(isPresented: $vm.isCreateAccountButtonPressed) {
                AddAccountView(includeNavigationStack: true)
            }
            .popover(isPresented: $vm.isCreateRecordButtonPressed) {
                CreateRecordMainView(recordData: vm.selectedRecordData)
            }
            .navigationDestination(isPresented: $vm.onPressedShowMoreFromList, destination: {
                AllRecordsView(topEdge: 0)

            })
        }
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    var floatingAddRecordButton: some View {
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
        }.padding(.trailing, 30)
    }
}
