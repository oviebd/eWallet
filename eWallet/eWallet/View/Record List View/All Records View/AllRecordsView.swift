//
//  AllRecordsView.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/8/24.
//

import SwiftUI

enum SortingDayEnums : String {
    case day_7 = "7 Days"
    case day_30 = "30 Days"
    case day_6_months = "6 Months"
    case day_1_year = "1 Year"
    
    func getStartDate() -> Date?{
        let today : Date = Date.now
        switch self {
            
        case .day_7:
            return today.dayBefore(dayNumber: 7)
        case .day_30:
            return today.dayBefore(dayNumber: 30)
        case .day_6_months:
            return today.dayBefore(dayNumber: 180)
        case .day_1_year:
            return today.dayBefore(dayNumber: 365)
        }
    }
    
    func getEndDate() -> Date {
        return Date.now
    }
}

struct AllRecordsView: View {
    @Environment(\.presentationMode) var presentationMode
    private let topBarConfig = CommonTopBarData(title: "Records",leftIconName: "xmark", hasShadow: false)
    @State private var currentPage = 0
    
    @StateObject var vm  = AllRecordsVM()
    @State var selectedSortedDay : SortingDayEnums = .day_30
    
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
                     
                        CustomSearchView(searchText: $searchText, offset: $offset, onSearchPressed : { searchText in
                            
                        })

                    }.frame(height: maxHeight)
                       .offset(y: -offset)
                        .zIndex(1)

                    
                    VStack (spacing : 0){
                        
                        ForEach(vm.recordListByDateData.dataByDateDic.keys.sorted(), id: \.self){ item in
                            
                            let records = vm.recordListByDateData.dataByDateDic[item] ?? [RecordData]()
                            DateWiseRecordListItem(date: item, dataList: records)
                        }
                        
                    }
                    .padding(.top,20)
                    
                    .zIndex(0)
                }
                .modifier(OffsetModifier(offset: $offset))
            }
            .coordinateSpace(.named("SCROLL"))

           
            Spacer()
            RecordFilterView(){ filterData in
                print("start \(filterData.startDate?.description)")
                print("start \(filterData.endDate?.description)")
                
            }
           // SwipeToResizeView()
        }
        .edgesIgnoringSafeArea(.bottom)
        
        .navigationBarHidden(true)
        
        
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
            Text(SortingDayEnums.day_7.rawValue).tag(SortingDayEnums.day_7)
            Text(SortingDayEnums.day_30.rawValue).tag(SortingDayEnums.day_30)
            Text(SortingDayEnums.day_6_months.rawValue).tag(SortingDayEnums.day_6_months)
            Text(SortingDayEnums.day_1_year.rawValue).tag(SortingDayEnums.day_1_year)
        }
        .pickerStyle(.segmented)
    }
}
