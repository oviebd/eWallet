//
//  CreateRecordVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 19/7/24.
//

import Foundation

class CreateRecordVM: ObservableObject {
    
    @Published private var recordData : RecordData?
    @Published var isEdit : Bool = false
    
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
    
    let recordTypes : [RecordTypeEnum]
    var recordRepo: RecordDataRepository

    init(recordData : RecordData?) {
        
        self.recordData = recordData
        recordTypes = [.INCOME,.EXPENSE,.TRANSFER]
        additionalRecordData = AdditionalRecordData(note: "", date: Date.now, time: Date.now)
        recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository())
        getRecords()
        
        prepareForEdit()
    }
    
    func prepareForEdit(){
        guard let record = recordData else {
            return
        }
        self.isEdit = true
        amountInput = record.amount.toString()
        account = record.account
        fromAccount = record.fromAccount
        selectedCategoryData = record.catagory
        additionalRecordData = AdditionalRecordData(note: record.note, date: record.date, time: record.time)
        selectedRecordType = RecordTypeEnum(rawValue: record.recordType) ?? .EXPENSE
        
    }

    func getRecords() {
        _ = recordRepo.getRecords()
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

        var newRecordData = RecordData(note: additionalRecordData.note,
                                    recordType: selectedRecordType.rawValue,
                                    amount: amount,
                                    date: additionalRecordData.date,
                                    time: additionalRecordData.time,
                                    catagory: selectedCategoryData,
                                    account: accountData,
                                    fromAccount: fromAccount)
        
        if let id = recordData?.id, isEdit == true{
            newRecordData.id = id
        }
    
        if isEdit {
            let isSuccess = recordRepo.editRecord(recordData: newRecordData)
            print("IS Record Added \(isSuccess)")
        }else{
            let isSuccess = recordRepo.addRecord(recordData: newRecordData)
            print("IS Record Added \(isSuccess)")
        }
        

        getRecords()
    }
    
    func onDeletePressed(){
        guard let recordData = recordData else {
            return
        }
        recordRepo.deleteRecord(recordData: recordData)
        
    }
    
}
