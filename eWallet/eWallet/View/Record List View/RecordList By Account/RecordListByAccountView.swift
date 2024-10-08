//
//  RecordListByAccountView.swift
//  eWallet
//
//  Created by Habibur Rahman on 11/9/24.
//

import SwiftUI

struct RecordListByAccountView: View {
    @Environment(\.presentationMode) var presentationMode
    private let topBarConfig = CommonTopBarData(title: "Records", bgColor: Color.theme.accountGridCardBG, forgroundColor: .white, leftIconName: "xmark", hasShadow: false)

    @StateObject var vm : RecordsListByAccountVM

    let maxHeight: CGFloat = 250
    var topEdge: CGFloat
    @State var offset: CGFloat = 0
    @State var searchText: String = ""
    
    init(accountData : AccountData?, topEdge : CGFloat) {
        _vm = StateObject(wrappedValue: RecordsListByAccountVM(accountData: accountData))
        
        self.topEdge = topEdge
    }


    var body: some View {
        ZStack(alignment: .bottomTrailing){
            VStack(spacing: 0) {
                CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                    self.presentationMode.wrappedValue.dismiss()
                })

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        GeometryReader { _ in

                            AreaChartView(offset: $offset, chartDatas: $vm.chartData)
                                .padding(.bottom, 20)
                                .padding(.top, 10)
                                .padding(.horizontal, 20)
                                .background(RoundedRectangle(cornerRadius: 0).fill(Color.theme.accountGridCardBG))

                        }.frame(height: maxHeight)
                            .offset(y: -offset)
                            .zIndex(1)

                        VStack(spacing: 15) {
                            ForEach(vm.recordListByDateData.dataByDateDic.keys.sorted { $0 > $1 }, id: \.self) { item in

                                let records = vm.recordListByDateData.dataByDateDic[item] ?? [RecordData]()
                                DateWiseRecordListItem(date: item, dataList: records){ recordData in
                                    
                                    vm.selectedRecordData = recordData
                                    vm.goRecordScreen = true
                                }
                            }
                            
                            Rectangle().fill(Color.clear)
                                .frame(height: 500)
                        }
                        .padding(.top, 40)
                        .background(Color.theme.white)

                        .zIndex(0)
                    }
                    .modifier(OffsetModifier(offset: $offset))
                }
                .coordinateSpace(.named("SCROLL"))

                Spacer()
            }
            
            
            floatingAddRecordButton
                .offset(x:-40, y : -50)
        }
        
     
        .background(Color.theme.white)
        .popover(isPresented: $vm.goRecordScreen) {
            CreateRecordMainView(recordData: vm.selectedRecordData)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarHidden(true)
    }
}

#Preview {
    RecordListByAccountView(accountData: nil, topEdge: 40)
}

extension RecordListByAccountView {
    var floatingAddRecordButton: some View {
        
        Image(systemName: "plus")
            .resizable()
            .frame(width: 25, height: 25)
            .padding()
            
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.theme.accountGridCardBG)
            ).foregroundStyle(Color.white)
            .onTapGesture {
                vm.selectedRecordData = nil
                vm.goRecordScreen = true
            }
    }
}
