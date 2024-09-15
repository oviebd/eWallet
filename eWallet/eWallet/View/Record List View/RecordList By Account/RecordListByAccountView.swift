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

    @StateObject var vm = RecordsListByAccountVM()

    let maxHeight: CGFloat = 250
    var topEdge: CGFloat
    @State var offset: CGFloat = 0
    @State var searchText: String = ""


    var body: some View {
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
                            DateWiseRecordListItem(date: item, dataList: records)
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
        .background(Color.theme.accountGridCardBG)
        .edgesIgnoringSafeArea(.bottom)

        .navigationBarHidden(true)
    }
}

#Preview {
    RecordListByAccountView(topEdge: 40)
}
