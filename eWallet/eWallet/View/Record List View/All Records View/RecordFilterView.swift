//
//  RecordFilterView.swift
//  eWallet
//
//  Created by Habibur Rahman on 1/9/24.
//

import SwiftUI

struct RecordFilterView: View {
    
    @StateObject var vm  = AllRecordsVM()
    @State var selectedSortedDay : DortingDayEnums = .day_30
    
    var body: some View {
        VStack{
            Spacer()
            sotByDateSegmentedView
        }
    }
}

#Preview {
    RecordFilterView()
}

extension RecordFilterView {
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
