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


    @Published var fromAccount: AccountData? // Only use for transfer
    @Published var account: AccountData?
    @Published var selectedCategoryData: CategoryData?

    @Published var alertModel = AlertDataUtils.alertDmmyDataSingleButton
    @Published var showingAlert = false
    @Published var isAccountCreated = false

    @Published var showDatePicker = false
    @Published var selectedDate : Date = Date.now
    
    @Published var isAddNotePressed = false
    @Published var noteText : String = ""
    
 
    let recordTypes : [RecordTypeEnum]
    var recordRepo: RecordDataRepository
    

    init(recordData : RecordData?) {
        
        self.recordData = recordData
        recordTypes = [.INCOME,.EXPENSE,.TRANSFER]
      //  additionalRecordData = AdditionalRecordData(note: "", date: Date.now, time: Date.now)
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
        noteText = record.note
        selectedDate = record.date
     //   additionalRecordData = AdditionalRecordData(note: record.note, date: record.date, time: record.time)
        selectedRecordType = RecordTypeEnum(rawValue: record.recordType) ?? .EXPENSE
        
    }

    func getRecords() {
        _ = recordRepo.getRecords()
    }
    
    
    func isDataValid() -> Bool {
        let amount = Double(amountInput) ?? 0.0
       // additionalRecordData.printData()

        guard let accountData = account else {
            return false
        }
        
        if selectedRecordType != .TRANSFER && selectedCategoryData == nil  {
            return false
        }
        
        if selectedRecordType == .TRANSFER && fromAccount == nil {
            return false
        }
        
        return true
    }

    func onSaveBtnPressed() -> Bool {
        
        let amount = Double(amountInput) ?? 0.0
       
        if isDataValid() == false{
            alertModel.title = "Failed!"
            AlertDataUtils.getAlertDatafrom(alertData: &alertModel, message: "Please fill all required fields.", alertType: .failure, positiveButtonTitle: "Ok", negativeButtonTitle: "")
            showingAlert = true
            return false
        }
        
        var newRecordData = RecordData(note: noteText,
                                    recordType: selectedRecordType.rawValue,
                                    amount: amount,
                                    date: selectedDate,
                                    catagory: selectedCategoryData,
                                    account: account,
                                    fromAccount: fromAccount)
        
        if let id = recordData?.id, isEdit == true{
            newRecordData.id = id
        }
    
        var isSuccess = false
        if isEdit {
            isSuccess = recordRepo.editRecord(recordData: newRecordData)
            //print("IS Record Added \(isSuccess)")
        }else{
            isSuccess = recordRepo.addRecord(recordData: newRecordData)
          //  print("IS Record Added \(isSuccess)")
        }
        
        getRecords()
        return isSuccess
    }
  
    
    func onDeletePressed() -> Bool {
        guard let recordData = recordData else {
            return false
        }
        return recordRepo.deleteRecord(recordData: recordData)
        
    }
    
}
