//
//  RecordSortingView.swift
//  eWallet
//
//  Created by Habibur Rahman on 4/9/24.
//

import SwiftUI

enum FilterByDatesEnums: String {
    case day_7 = "7 Days"
    case day_30 = "30 Days"
    case day_6_months = "6 Months"
    case day_1_year = "1 Year"

    func getStartDate() -> Date? {
        let today: Date = Date.now
        var date: Date? = today
        switch self {
        case .day_7:
            date = today.dayBefore(dayNumber: 7)
        case .day_30:
            date = today.dayBefore(dayNumber: 30)
        case .day_6_months:
            date = today.dayBefore(dayNumber: 180)
        case .day_1_year:
            date = today.dayBefore(dayNumber: 365)
        }

        return date?.updateWith(hour: 0, minutes: 0)
    }

    func getEndDate() -> Date {
        return Date.now.updateWith(hour: 23, minutes: 59)
    }
}

struct RecordFilterData {
    var startDate: Date?
    var endDate: Date?
    var searchText: String?
    var accountId: String?
    var categoryId: String?
    var type: FilterByDatesEnums?
}

struct RecordFilterView: View {
    @State private var viewHeight: CGFloat = 60

    let minHeight: CGFloat = 100
    let maxHeight: CGFloat = 195

    @State var selectedSortedDay: FilterByDatesEnums = .day_30

    @State var isDragUp = false
    @State var isDragStarted = true

    @State var isSelectAccountPressed: Bool = false
    @State var isSelectCategoryPressed: Bool = false

    @Binding var filterData: RecordFilterData

    @State var selectedAccount: AccountData?
    @State var selectedCategory: CategoryData?

    var body: some View {
        Spacer()

        VStack(spacing: 0) {
            
          
            HStack() {
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.theme.primaryDivider)
                    .frame(width: 50, height: 5)
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .offset(x: 0)
                
                Spacer()
                Image(systemName: "xmark.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.red)
                    .opacity(getCrossButtonOpacity())
                    .onTapGesture {
                        selectedCategory = nil
                        selectedAccount = nil
                    }
                
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
                    filterData.startDate = selectedSortedDay.getStartDate()
                    filterData.endDate = selectedSortedDay.getEndDate()

                   // onFilterChanged(filterData)
                }
            }

            .onChange(of: selectedAccount, { _, _ in
                filterData.accountId = selectedAccount?.id
            })
            .onChange(of: selectedCategory, { _, _ in
                filterData.categoryId = selectedCategory?.id
            })

            .popover(isPresented: $isSelectCategoryPressed) {
                SelectCatagoryView(selectedCategory: $selectedCategory)
            }

            .popover(isPresented: $isSelectAccountPressed) {
                AccountListView(selectedAccountData: $selectedAccount, isPopupView: true)
            }
    }
    
    func getCrossButtonOpacity() -> Double {
        if  selectedCategory != nil || selectedAccount != nil {
            return isDragUp ? 1 : 0
        }
        return 0
    }
}

#Preview {
    RecordFilterView (filterData: .constant(RecordFilterData()))
}

extension RecordFilterView {
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

extension RecordFilterView {
    var formPickerView: some View {
        VStack(spacing: 0) {
            DefaultFormPicker(iconName: "",
                              mainTitle: "Select Account",
                              rightTitle: selectedAccount?.title ?? "Select",
                              iconBgShape: .none) {
                isSelectAccountPressed = true
            }.frame(height: isDragUp ? 60 : 0)
                .hidden(!isDragUp)

            DefaultDividerView()
                .hidden(!isDragUp)

            DefaultFormPicker(iconName: "",
                              mainTitle: "Select Category",
                              rightTitle: selectedCategory?.title ?? "Select",
                              iconBgShape: .none) {
                isSelectCategoryPressed = true
            }.frame(height: isDragUp ? 60 : 0)
                .hidden(!isDragUp)
        }
    }
}
