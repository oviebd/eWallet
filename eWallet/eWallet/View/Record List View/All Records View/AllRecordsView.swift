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
    private let topBarConfig = CommonTopBarData(title: "Records",leftIconName: "xmark")
    
    @StateObject var vm  = AllRecordsVM()
    @State var selectedSortedDay : DortingDayEnums = .day_30
    
    var body: some View {
//        CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
//            //  vm.prepareRecordDetailsData()
//            self.presentationMode.wrappedValue.dismiss()
//        })
        
        
        VStack (spacing : 15){
            ForEach(vm.recordListByDateData.dataByDateDic.keys.sorted(), id: \.self){ item in
                
                let records = vm.recordListByDateData.dataByDateDic[item] ?? [RecordData]()
                DateWiseRecordListItem(date: item, dataList: records)
            }
            
        }.padding(.top,30)
        
        
        Spacer()
        
        VStack{
            Picker("What is your favorite color?", selection: $selectedSortedDay) {
                Text(DortingDayEnums.day_7.rawValue).tag(DortingDayEnums.day_7)
                Text(DortingDayEnums.day_30.rawValue).tag(DortingDayEnums.day_30)
                Text(DortingDayEnums.day_6_months.rawValue).tag(DortingDayEnums.day_6_months)
                Text(DortingDayEnums.day_1_year.rawValue).tag(DortingDayEnums.day_1_year)
            }
            .pickerStyle(.segmented)
        }.frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(Color.theme.white
                .shadow(radius: 10))
   
        .navigationBarHidden(false)
    }
}

#Preview {
    AllRecordsView()
}
