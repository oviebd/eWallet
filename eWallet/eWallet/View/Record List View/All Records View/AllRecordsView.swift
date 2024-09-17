//
//  AllRecordsView.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/8/24.
//

import SwiftUI

struct AllRecordsView: View {
    @Environment(\.presentationMode) var presentationMode
    private let topBarConfig = CommonTopBarData(title: "Records", leftIconName: "xmark", hasShadow: false)
    @State private var currentPage = 0

    @StateObject var vm = AllRecordsVM()
    @State var selectedSortedDay: FilterByDatesEnums = .day_30

    let maxHeight: CGFloat = 40 // UIScreen.main.bounds.height / 2.3
    var topEdge: CGFloat
    @State var offset: CGFloat = 0


    var body: some View {
        
        ZStack(alignment : .bottomTrailing){
            VStack(spacing: 0) {
                CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                    self.presentationMode.wrappedValue.dismiss()
                })

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        GeometryReader { _ in

                            CustomSearchView(searchText: $vm.searchText, offset: $offset, onSearchPressed: { _ in })

                        }.frame(height: maxHeight)
                            .offset(y: -offset)
                            .zIndex(1)

                        VStack(spacing: 15) {
                        
                            ForEach(vm.recordListByDateData.dataByDateDic.keys.sorted{ $0 > $1 }, id: \.self) { item in

                                let records = vm.recordListByDateData.dataByDateDic[item] ?? [RecordData]()
                                DateWiseRecordListItem(date: item, dataList: records){ recordData in
                                    vm.selectedRecordData = recordData
                                    vm.goRecordScreen = true
                                }
                            }
                        }
                        .padding(.top, 20)

                        .zIndex(0)
                    }
                    .modifier(OffsetModifier(offset: $offset))
                }
                .coordinateSpace(.named("SCROLL"))

                Spacer()
                RecordFilterView(filterData: $vm.filteredData)
                // SwipeToResizeView()
            }
            
//            floatingAddRecordButton
//                .offset(x:-40, y:-140)
                
        }
        
        
        .popover(isPresented: $vm.goRecordScreen) {
            CreateRecordMainView(recordData: vm.selectedRecordData)
        }
        .edgesIgnoringSafeArea(.bottom)

        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationStack {
        AllRecordsView(topEdge: 0)
    }
}

extension AllRecordsView {
    var sotByDateSegmentedView: some View {
        Picker("What is your favorite color?", selection: $selectedSortedDay) {
            Text(FilterByDatesEnums.day_7.rawValue).tag(FilterByDatesEnums.day_7)
            Text(FilterByDatesEnums.day_30.rawValue).tag(FilterByDatesEnums.day_30)
            Text(FilterByDatesEnums.day_6_months.rawValue).tag(FilterByDatesEnums.day_6_months)
            Text(FilterByDatesEnums.day_1_year.rawValue).tag(FilterByDatesEnums.day_1_year)
        }
        .pickerStyle(.segmented)
    }
}

extension AllRecordsView {
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

