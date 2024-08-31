//
//  CreateRecordMainView.swift
//  eWallet
//
//  Created by Habibur Rahman on 20/3/24.
//

import SwiftUI

struct CreateRecordMainView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm: CreateRecordVM
    @State private var favoriteColor = 0

    let formItemVerticalPadding = 10.0

    private let topBarConfig = CommonTopBarData(title: "Add Record",
                                                bgColor: Color.theme.accountGridCardBG,
                                                forgroundColor: Color.theme.white,
                                                leftIconName: "xmark")

    init(recordData: RecordData?) {
        _vm = StateObject(wrappedValue: CreateRecordVM(recordData: recordData))

        // UISegmentedControl.appearance().selectedSegmentTintColor = .blue
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }

    var body: some View {
        VStack(spacing: 0) {

            CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                //  vm.prepareRecordDetailsData()
                self.presentationMode.wrappedValue.dismiss()
            })

            ScrollView {
                VStack(spacing: 0) {
                    VStack {
                        Picker("What is your favorite color?", selection: $vm.selectedRecordType) {
                            Text(vm.recordTypes[0].rawValue).tag(RecordTypeEnum.INCOME)
                            Text(vm.recordTypes[1].rawValue).tag(RecordTypeEnum.EXPENSE)
                            Text(vm.recordTypes[2].rawValue).tag(RecordTypeEnum.TRANSFER)
                        }
                        .pickerStyle(.segmented)

                    }.padding(.horizontal, 20)
                        .background(Color.theme.accountGridCardBG)

                    addNumberView
                        // middleView
                        // .frame(height: 200)
                        .background(Color.theme.accountGridCardBG)
                    pickerFormView
                    // Spacer()
                }
                Spacer()
            }
        }

        .navigationBarHidden(true)

        .popover(isPresented: $vm.isSelectCategoryPressed) {
            SelectCatagoryView(selectedCategory: $vm.selectedCategoryData)
        }
        .popover(isPresented: $vm.isAccountTypePressed) {
            AccountListView(selectedAccountData: $vm.account, isPopupView: true)
        }
        .popover(isPresented: $vm.isFromAccountTypePressed) {
            AccountListView(selectedAccountData: $vm.fromAccount, isPopupView: true)
        }
       
        .popover(isPresented: $vm.isAddNotePressed) {
            AddNoteView(note: $vm.noteText)
        }
    }
}

#Preview {
    CreateRecordMainView(recordData: nil)
}

extension CreateRecordMainView {
    var addNumberView: some View {
        HStack {
            Text(vm.selectedRecordType.symbol)
                .font(.system(size: 70))
            Spacer()

            TextField("0", text: $vm.amountInput)
                .multilineTextAlignment(.trailing)
                .font(.system(size: 70))
                .minimumScaleFactor(0.01)
                .fontWeight(.semibold)
                .disabled(true)

            Text("BDT")
                .font(.system(size: 20))
                .offset(x: 0, y: -10)
                .padding(.leading, 10)
                .fontWeight(.medium)
                .padding(.trailing, 20)
        }.padding(.leading, 15)
            .padding(.vertical, 40)
            .foregroundColor(Color.theme.white)
    }
}

extension CreateRecordMainView {
    var pickerFormView: some View {
        VStack (alignment:.leading, spacing: 0) {
            
            Text("GENERAL")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment : .bottomLeading)
                .padding(10)
                .padding(.top,40)
                .font(.system(size: 20))
                .WithDefaultRectangularBgModifier(bgColor: Color.theme.gray.opacity(0.2), cornerRadius: 0)
                
                
            
            DefaultFormPicker(iconName: "bag",
                              mainTitle: vm.selectedRecordType == .TRANSFER ? "To Account" : "Account",
                              rightTitle: vm.account?.title ?? "",
                              isRequired: true) {
                vm.isAccountTypePressed = true
            }
            .padding(.horizontal, 20)
            .padding(.vertical, formItemVerticalPadding)
         //   .padding(.top, formItemVerticalPadding)

            DefaultDividerView()

            if vm.selectedRecordType == .TRANSFER {
                DefaultFormPicker(iconName: "questionmark",
                                  mainTitle: "From Account",
                                  rightTitle: vm.fromAccount?.title ?? "",
                                  isRequired: true,
                                  iconBgShape: .roundedRectangle) {
                    vm.isFromAccountTypePressed = true
                }
                .padding(.horizontal, 20)
                .padding(.vertical, formItemVerticalPadding)

            } else {
                DefaultFormPicker(iconName: "questionmark",
                                  mainTitle: "Category",
                                  rightTitle: vm.selectedCategoryData?.title ?? "",
                                  isRequired: true,
                                  iconBgShape: .circle,
                                  iconBgColor: .gray) {
                    vm.isSelectCategoryPressed = true
                }
                .padding(.horizontal, 20)
                .padding(.vertical, formItemVerticalPadding)
            }
            
            DefaultDividerView()

            // Date Time
            DefaultFormPicker(iconName: "calendar.badge.clock",
                              mainTitle: "Date & Time",
                              rightTitle: vm.selectedDate.asShortDateString(),
                              iconBgShape: .none,
                              iconBgColor: .green,
                              iconForgroundColor: .gray) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    vm.showDatePicker.toggle()
                }

            }.padding(.horizontal, 20)
                .padding(.vertical, formItemVerticalPadding)

            DefaultDividerView()

            if vm.showDatePicker {
                DatePicker("Date and Time Picker",
                           selection: $vm.selectedDate, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle())

                    .padding(.horizontal, 40)
                    .padding(.vertical, 0)
            }

            DefaultDividerView()
        
            
            // Note
            DefaultFormPicker(iconName: "note.text.badge.plus",
                              mainTitle: "Note",
                              rightTitle: vm.noteText,
                              iconBgShape: .none,
                              iconBgColor: .green,
                              iconForgroundColor: .gray) {
                vm.isAddNotePressed = true
            }.padding(.horizontal, 20)
                .padding(.vertical, formItemVerticalPadding)
            
            DefaultDividerView()
            
            Text("ACTIONS")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment : .bottomLeading)
                .padding(10)
                .padding(.top,30)
                .font(.system(size: 20))
                .WithDefaultRectangularBgModifier(bgColor: Color.theme.gray.opacity(0.2), cornerRadius: 0)
            
            
            Text(vm.isEdit ? "Edit" : "Save")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment : .center)
                .padding(20)
                .font(.system(size: 20))
                .WithDefaultRectangularBgModifier(bgColor: Color.theme.accountGridCardBG,cornerRadius: 10)
                .foregroundStyle(.white)
                .padding(.horizontal,20)
                .padding(.top,20)
                .onTapGesture {
                   vm.onSaveBtnPressed()
                }
            
            
            Text("Delete")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment : .center)
                .padding(20)
                .font(.system(size: 20))
                .WithDefaultRectangularBgModifier(bgColor: Color.red, cornerRadius: 10)
                .foregroundStyle(.white)
                .padding(.horizontal,20)
                .padding(.top,20)
                .onTapGesture {
                    vm.onDeletePressed()
                }
            

            Spacer()
            
        }
        .background(Color.white)
    }
}
