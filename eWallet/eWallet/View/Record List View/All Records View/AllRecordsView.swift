//
//  AllRecordsView.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/8/24.
//

import SwiftUI

enum DortingDayEnums : String {
    case day_7 = "7 Days"
    case day_30 = "30 Days"
    case day_6_months = "6 Months"
    case day_1_year = "1 Year"
}

struct AllRecordsView: View {
    @Environment(\.presentationMode) var presentationMode
    private let topBarConfig = CommonTopBarData(title: "Records",leftIconName: "xmark", hasShadow: false)
    @State private var currentPage = 0
    
    @StateObject var vm  = AllRecordsVM()
    @State var selectedSortedDay : DortingDayEnums = .day_30
    
    let maxHeight: CGFloat = 50 // UIScreen.main.bounds.height / 2.3
    var topEdge: CGFloat
    @State var offset: CGFloat = 0
    @State var searchText: String = ""

    var body: some View {

        VStack (spacing : 0){
            
            CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                self.presentationMode.wrappedValue.dismiss()
            })
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                   
                    GeometryReader { _ in
                     
                        CustomSearchView(searchText: $searchText, offset: $offset)

                    }.frame(height: maxHeight)
                       .offset(y: -offset)
                        .zIndex(1)

                    
                    VStack (spacing : 0){
                        
                        ForEach(vm.recordListByDateData.dataByDateDic.keys.sorted(), id: \.self){ item in
                            
                            let records = vm.recordListByDateData.dataByDateDic[item] ?? [RecordData]()
                            DateWiseRecordListItem(date: item, dataList: records)
                        }
                        
                        ForEach(vm.recordListByDateData.dataByDateDic.keys.sorted(), id: \.self){ item in
                            
                            let records = vm.recordListByDateData.dataByDateDic[item] ?? [RecordData]()
                            DateWiseRecordListItem(date: item, dataList: records)
                        }

                        
                        
                        ForEach(vm.recordListByDateData.dataByDateDic.keys.sorted(), id: \.self){ item in
                            
                            let records = vm.recordListByDateData.dataByDateDic[item] ?? [RecordData]()
                            DateWiseRecordListItem(date: item, dataList: records)
                        }

                        
                    }.padding(.top,30)
                    
                    .zIndex(0)
                }
                .modifier(OffsetModifier(offset: $offset))
            }
            .coordinateSpace(.named("SCROLL"))

           
            Spacer()
            SwipeToResizeView()
        }
        .edgesIgnoringSafeArea(.bottom)
        
        .navigationBarHidden(true)
          //  .navigationTitle("Records")
            //.navigationBarTitleDisplayMode(.large)
        
    }
}

#Preview {
    NavigationStack{
        AllRecordsView(topEdge: 0)
    }
    
}

extension AllRecordsView {
    var sotByDateSegmentedView : some View{
        Picker("What is your favorite color?", selection: $selectedSortedDay) {
            Text(DortingDayEnums.day_7.rawValue).tag(DortingDayEnums.day_7)
            Text(DortingDayEnums.day_30.rawValue).tag(DortingDayEnums.day_30)
            Text(DortingDayEnums.day_6_months.rawValue).tag(DortingDayEnums.day_6_months)
            Text(DortingDayEnums.day_1_year.rawValue).tag(DortingDayEnums.day_1_year)
        }
        .pickerStyle(.segmented)
    }
}
