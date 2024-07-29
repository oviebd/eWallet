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
                          account: account?.convertToAccountData())
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

    func   addRecord(recordData: RecordData) -> Bool {
        let newRecord = RecordEntity(context: manager.context)
        newRecord.note = recordData.note
        newRecord.amount = recordData.amount
        newRecord.id = recordData.id
        newRecord.type = recordData.recordType
        newRecord.date = recordData.date
        newRecord.time = recordData.time

        let accountRepo = AccountDataRepository.shared(accountRepo: CDAccountRepository())
       
        let categoryEntity = CategoryDataRepository.shared(categoryRepo: CDCategoryRepository()).getCategoryEntityFromId(id: recordData.catagory?.id ?? "")
        let accountEntity = accountRepo.getAccountEntityFromId(id: recordData.account?.id ?? "")

        newRecord.category = categoryEntity
        newRecord.account = accountEntity



        let isRecordCreated = manager.save()
        
        if isRecordCreated {
            var updatedRecord = recordData.account
            updatedRecord?.amount -= recordData.amount
            return accountRepo.updateAccount(account: updatedRecord)
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
