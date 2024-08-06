//
//  CDRecordRepository.swift
//  eWallet
//
//  Created by Habibur Rahman on 23/7/24.
//

import CoreData
import Foundation

extension RecordEntity {
    func toRecorData() -> RecordData {
        return RecordData(note: note ?? "", recordType: type ?? "", amount: amount,
                          date: date ?? .now, time: time ?? .now,
                          catagory: category?.convertToCategory(),
                          account: account?.convertToAccountData(),
                          fromAccount: fromAccount?.convertToAccountData())
    }
}

struct CDRecordRepository: RecordDataRepoProtocol {
    let manager = CoreDataManager.instance

    private func getRecordsEntityList() -> [RecordEntity] {
        let request = NSFetchRequest<RecordEntity>(entityName: Constants.CORE_DATA.RecordEntity)

        do {
            let currencyDatas = try manager.context.fetch(request)

            return currencyDatas

        } catch {
            print("Error Fetching.. \(error.localizedDescription)")
        }
        return [RecordEntity]()
    }

    func getRecords() -> [RecordData] {
        var dataList = [RecordData]()

        for record in getRecordsEntityList() {
            let recordData = record.toRecorData()
            print("U>> record note is  \(recordData.note)")
            dataList.append(recordData)
        }
        return dataList
    }

    func getRecodrdsFrom(account: AccountData) -> [RecordData] {
        [RecordData]()
    }

    func addRecord(recordData: RecordData) -> Bool {
        let newRecord = RecordEntity(context: manager.context)
        newRecord.note = recordData.note
        newRecord.amount = recordData.amount
        newRecord.id = recordData.id
        newRecord.type = recordData.recordType
        newRecord.date = recordData.date
        newRecord.time = recordData.time

        let recordType = RecordTypeEnum(rawValue: recordData.recordType)

        let accountRepo = AccountDataRepository.shared(accountRepo: CDAccountRepository())
        
        let categoryEntity = CategoryDataRepository.shared(categoryRepo: CDCategoryRepository()).getCategoryEntityFromId(id: recordData.catagory?.id ?? "")
        let accountEntity = accountRepo.getAccountEntityFromId(id: recordData.account?.id ?? "")
        let fromAccountEntity = accountRepo.getAccountEntityFromId(id: recordData.fromAccount?.id ?? "")

        newRecord.category = categoryEntity
        newRecord.account = accountEntity

        if recordType == .TRANSFER {
            newRecord.fromAccount = fromAccountEntity
        }

        let isRecordCreated = manager.save()

        if isRecordCreated {
            let isAccountUpdateSuccess = updateAccountsByRecordData(recordData: recordData)
        }

        return isRecordCreated
    }

    func editRecord(recordData: RecordData) -> Bool {
        return true
    }

    func deleteRecord(recordData: RecordData) -> Bool {
        return true
    }
}

extension CDRecordRepository {
    
    func updateAccountsByRecordData(recordData : RecordData) -> Bool{
     
        let accountRepo = AccountDataRepository.shared(accountRepo: CDAccountRepository())
        let accountEntity = accountRepo.getAccountEntityFromId(id: recordData.account?.id ?? "")
        var account = recordData.account
        let recordType = RecordTypeEnum(rawValue: recordData.recordType)
        
        let (accountAmount,fromAccountAmount) = getUpdatedAmountBasedOnRecordType(recordType: recordType,
                                                                                  transactionAmount: account?.amount, accountAmount: recordData.fromAccount?.amount)
        
        if recordType == .TRANSFER {
            var fromAccount = recordData.fromAccount
            fromAccount?.amount = fromAccountAmount
            _ = accountRepo.updateAccount(account: fromAccount)
        }
        
        account?.amount += accountAmount
        
//        switch recordType {
//        case .INCOME:
//            account?.amount += recordData.amount
//            break
//        case .EXPENSE:
//            account?.amount -= recordData.amount
//            break
//        case .TRANSFER:
//            var fromAccount = recordData.fromAccount
//            fromAccount?.amount += recordData.amount
//            account?.amount -= recordData.amount
//            _ = accountRepo.updateAccount(account: fromAccount)
//        case .NONE:
//            break
//        }
        return accountRepo.updateAccount(account: account)
    }
    
    func getUpdatedAmountBasedOnRecordType(recordType : RecordTypeEnum?,
                                           transactionAmount : Double?,
                                           accountAmount : Double?,
                                           fromAccountAmount : Double? = 0) -> (Double,Double){
        
        var accountAmount = accountAmount ?? 0
        var fromAccountAmount = fromAccountAmount ?? 0
        let transactionAmount = transactionAmount ?? 0
        
        guard let recordType = recordType else {
            return (accountAmount, fromAccountAmount)
        }
        
        switch recordType {
        case .INCOME:
           accountAmount += transactionAmount
            break
        case .EXPENSE:
            accountAmount -= transactionAmount
            break
        case .TRANSFER:
           
            fromAccountAmount += transactionAmount
            accountAmount -= transactionAmount
    
        }
        
        return (accountAmount, fromAccountAmount)
    }
}
