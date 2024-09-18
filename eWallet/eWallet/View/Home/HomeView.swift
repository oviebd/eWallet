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
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 0) {
                    CommonTopBar(data: topBarConfig)
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 0) {
                            AccountGridView(onAddButtonPressed: {
                                                vm.isCreateAccountButtonPressed = true
                                            },
                                            onAccountItemPressed: { selectedAccount in
                                vm.selectedAccount = selectedAccount
                                                vm.onSingleAccountButtonPressed = true
                                            })

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
                            
                            CashFlowView()
                                .padding(.top,40)
                                .padding(.horizontal, 20)
                                .padding(.bottom,100)
                            

                            Spacer()
                        }
                    }
                }

                floatingAddRecordButton
                    .offset(x:-40, y : -30)
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

            .navigationDestination(isPresented: $vm.onSingleAccountButtonPressed, destination: {
                RecordListByAccountView(accountData: vm.selectedAccount, topEdge: 0)

            })
        }
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    var floatingAddRecordButton: some View {
        
        Image(systemName: "plus")
            .resizable()
            .frame(width: 30, height: 30)
            .padding()
            
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.theme.accountGridCardBG)
            ).foregroundStyle(Color.white)
            .onTapGesture {
                vm.selectedRecordData = nil
                vm.isCreateRecordButtonPressed = true
            }
    }
}
