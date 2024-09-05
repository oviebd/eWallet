//
//  RecordSortingView.swift
//  eWallet
//
//  Created by Habibur Rahman on 4/9/24.
//

import SwiftUI

struct RecordFilterData{
    var startDate : Date?
    var endDate : Date?
    var type : SortingDayEnums?
}

struct RecordFilterView: View {
  
    @State private var viewHeight: CGFloat = 60 
    

    let minHeight: CGFloat = 100
    let maxHeight: CGFloat = 195
    @State var selectedSortedDay: SortingDayEnums = .day_30
    @State var isDragUp = false
    @State var isDragStarted = true
    
    var onFilterChanged: ((RecordFilterData) -> Void)

    var body: some View {
        Spacer()

        VStack(spacing: 0) {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.theme.primaryDivider)
                    .frame(width: 50, height: 5)
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }.frame(maxWidth: .infinity)
                .frame(height: 20)
                .background(Color.white)
                .gesture(
                    DragGesture()
                        .onChanged { value in

                            if isDragStarted == false {
                                isDragUp = value.translation.height < 0
                                let newHeight = isDragUp ? maxHeight : minHeight
                                viewHeight = newHeight

                                isDragStarted = true
                            }
                        }
                        .onEnded { _ in
                            isDragStarted = false
                        }
                )

            formPickerView
                .frame(height: isDragUp ? 125 : 0)
                .padding(.bottom, 10)

            sotByDateSegmentedView
                .frame(height: 30)
                .padding(.bottom, 20)
        }.animation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.5), value: viewHeight)
            // .frame(height: viewHeight)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white)
                .shadow(radius: 2))
        
            .onChange(of: selectedSortedDay) { oldValue, newValue in
               
                if oldValue != newValue {
                    let recordFilterData = RecordFilterData(startDate: selectedSortedDay.getStartDate(), endDate: selectedSortedDay.getEndDate(), type: newValue)
                    
                    onFilterChanged(recordFilterData)
                }
                
            }
    }
}

#Preview {
    RecordFilterView(){ _ in}
}

extension RecordFilterView {
    var sotByDateSegmentedView: some View {
        Picker("What is your favorite color?", selection: $selectedSortedDay) {
            Text(SortingDayEnums.day_7.rawValue).tag(SortingDayEnums.day_7)
            Text(SortingDayEnums.day_30.rawValue).tag(SortingDayEnums.day_30)
            Text(SortingDayEnums.day_6_months.rawValue).tag(SortingDayEnums.day_6_months)
            Text(SortingDayEnums.day_1_year.rawValue).tag(SortingDayEnums.day_1_year)
        }
        .pickerStyle(.segmented)
    }
}

extension RecordFilterView {
    var formPickerView: some View {
        VStack(spacing: 0) {
            DefaultFormPicker(iconName: "", mainTitle: "Select Account", rightTitle: "Select", iconBgShape: .none) {
            }.frame(height: isDragUp ? 60 : 0)
                .hidden(!isDragUp)

            DefaultDividerView()
                .hidden(!isDragUp)

            DefaultFormPicker(iconName: "", mainTitle: "Select Category", rightTitle: "Select", iconBgShape: .none) {
            }.frame(height: isDragUp ? 60 : 0)
                .hidden(!isDragUp)
        }
    }
}
