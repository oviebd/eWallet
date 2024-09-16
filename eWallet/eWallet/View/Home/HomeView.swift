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
            ZStack(alignment: .bottom) {
                VStack(spacing: 0) {
                    CommonTopBar(data: topBarConfig)
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 0) {
                            AccountGridView(onAddButtonPressed: {
                                                vm.isCreateAccountButtonPressed = true
                                            },
                                            onAccountItemPressed: { _ in
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
                                .padding(.top,20)
                                .padding(.horizontal, 20)
                            

                            Spacer()
                        }
                    }
                }

                floatingAddRecordButton
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
                RecordListByAccountView(topEdge: 0)

            })
        }
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    var floatingAddRecordButton: some View {
        Text("Add")

            .padding(.horizontal, 25)
            .padding(.vertical, 6)
            .font(.system(size: 16))
            .WithDefaultRectangularBgModifier(bgColor: Color.theme.accountGridCardBG, cornerRadius: 10)
            .foregroundStyle(.white)

            .onTapGesture {
                vm.selectedRecordData = nil
                vm.isCreateRecordButtonPressed = true
            }
    }
}
