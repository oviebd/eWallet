//
//  RecordListByAccountView.swift
//  eWallet
//
//  Created by Habibur Rahman on 11/9/24.
//

import SwiftUI

struct RecordListByAccountView: View {
    @Environment(\.presentationMode) var presentationMode
    private let topBarConfig = CommonTopBarData(title: "Records", leftIconName: "xmark", hasShadow: false)
    

    @StateObject var vm = AllRecordsVM()
  

    let maxHeight: CGFloat = 100
    let minHeight: CGFloat = 50// UIScreen.main.bounds.height / 2.3
    var topEdge: CGFloat
    @State var offset: CGFloat = 0
    @State var searchText: String = ""

    // @State var filteredData : RecordFilterData?

    var body: some View {
        VStack(spacing: 0) {
            CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                self.presentationMode.wrappedValue.dismiss()
            })

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    GeometryReader { _ in

                        AreaChartView(offset: $offset)
                        
//                        CustomSearchView(searchText: $searchText, offset: $offset, onSearchPressed: { _ in
//
//                        })

                    }.frame(height: maxHeight)
                        .offset(y: -offset)
                        .zIndex(1)

                    VStack(spacing: 15) {
                    
                        ForEach(vm.recordListByDateData.dataByDateDic.keys.sorted{ $0 > $1 }, id: \.self) { item in

                            let records = vm.recordListByDateData.dataByDateDic[item] ?? [RecordData]()
                            DateWiseRecordListItem(date: item, dataList: records)
                        }
                    }
                    .padding(.top, 20)

                    .zIndex(0)
                }
                .modifier(OffsetModifier(offset: $offset))
            }
            .coordinateSpace(.named("SCROLL"))

            Spacer()
           
        }
        .edgesIgnoringSafeArea(.bottom)

        .navigationBarHidden(true)
    }
    
    
    
}

#Preview {
    RecordListByAccountView(topEdge: 40)
}
