//
//  CreateRecordVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 19/7/24.
//

import Foundation

class CreateRecordVM: ObservableObject {
    @Published var amountInput = "0"
    @Published var selectedRecordType: RecordTypeEnum = .EXPENSE
    @Published var isAccountTypePressed = false
    @Published var isFromAccountTypePressed = false
    @Published var isSelectCategoryPressed = false
    @Published var isDetailsBtnPressed = false

    @Published var fromAccount: AccountData? // Only use for transfer
    @Published var account: AccountData?
    @Published var selectedCategoryData: CategoryData?

    @Published var alertModel = AlertDataUtils.alertDmmyDataSingleButton
    @Published var showingAlert = false
    @Published var isAccountCreated = false

    @Published var additionalRecordData: AdditionalRecordData

    var recordRepo: RecordDataRepository

    init() {
        additionalRecordData = AdditionalRecordData(note: "", date: Date.now, time: Date.now)
        recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository())
        getRecords()
    }

    func getRecords() {
        let records = recordRepo.getRecords()
//        for record in records {
//          //  print("record is \(record.note) account is \(record.account?.title)  cat is \(record.catagory?.title)")
//        }
    }

    func onSaveBtnPressed() {
        let amount = Double(amountInput) ?? 0.0
        additionalRecordData.printData()

        guard let accountData = account else {
            return
        }
//        guard let categoryData = selectedCategoryData else {
//            return
//        }

        let recordData = RecordData(note: additionalRecordData.note,
                                    recordType: selectedRecordType.rawValue,
                                    amount: amount,
                                    date: additionalRecordData.date,
                                    time: additionalRecordData.time,
                                    catagory: selectedCategoryData,
                                    account: accountData,
                                    fromAccount: fromAccount)

        let isSuccess = recordRepo.addRecord(recordData: recordData)

        print("IS Record Added \(isSuccess)")

        getRecords()
    }
}
