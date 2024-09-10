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
        return RecordData(id: id ?? "", note: note ?? "", recordType: type ?? "", amount: amount,
                          date: date ?? .now,
                          catagory: category?.convertToCategory(),
                          account: account?.convertToAccountData(),
                          fromAccount: fromAccount?.convertToAccountData())
    }
}

struct CDRecordRepository: RecordDataRepoProtocol {
    
    let manager = CoreDataManager.instance
    let accountRepo = AccountDataRepository.shared(accountRepo: CDAccountRepository())

    private func getRecordsEntityList() -> [RecordEntity] {
        let request = NSFetchRequest<RecordEntity>(entityName: Constants.CORE_DATA.RecordEntity)
        let sort = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sort]

        do {

            let currencyDatas = try manager.context.fetch(request)
            return currencyDatas

        } catch {
            print("Error Fetching.. \(error.localizedDescription)")
        }
        return [RecordEntity]()
    }

    private func getRecordEntityFromId(id: String) -> RecordEntity? {
        let request = RecordEntity.fetchRequest() // (entityName: Constants.CORE_DATA.RecordEntity)
        let idPredicate = NSPredicate( format: "id = %@", id)
        request.predicate = idPredicate
        do {
            let datas = try manager.context.fetch(request)
            return datas.first

        } catch {
            print("Error Fetching.. \(error.localizedDescription)")
        }

        return nil
    }
    
    
    func getFilteredDatas(recordFilterData : RecordFilterData) -> [RecordData]{
        
        var dataList = [RecordData]()
        var predicates = [NSPredicate]()
        
        let startdate : NSDate? = recordFilterData.startDate as? NSDate
        let endDate : NSDate? = recordFilterData.endDate as? NSDate
        

        let request = RecordEntity.fetchRequest() // (entityName: Constants.CORE_DATA.RecordEntity)
       
        if let startdate = startdate ,let endDate = endDate {
            predicates.append(NSPredicate(format: "(date >= %@) AND (date <= %@)", startdate, endDate))
        }
        
        if let searchText = recordFilterData.searchText {
            predicates.append(NSPredicate(format: "note BEGINSWITH %@", searchText))
        }
        
        if let accountId = recordFilterData.accountId {
            predicates.append( NSPredicate(format: "account.id = %@", accountId))
        }
        
        if let catId = recordFilterData.categoryId {
            predicates.append( NSPredicate(format: "category.id = %@", catId))
        }
        

        let andPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: predicates)
     
        
        request.predicate = andPredicate
        let sort = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sort]
        
        
        do {
            let datas = try manager.context.fetch(request)
            
            for record in datas {
              //  print("U>> record account \(record.account?.id)" )
                let recordData = record.toRecorData()
               // print("U>> record note is  \(recordData.note)")
                dataList.append(recordData)
            }
        } catch {
           // print("Error Fetching.. \(error.localizedDescription)")
        }

        return dataList
        
    }
    
    func getRecordFromId(id: String) -> RecordData? {
       return getRecordEntityFromId(id: id)?.toRecorData()
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


        let categoryEntity = CategoryDataRepository.shared(categoryRepo: CDCategoryRepository()).getCategoryEntityFromId(id: recordData.catagory?.id ?? "")
        let accountEntity = accountRepo.getAccountEntityFromId(id: recordData.account?.id ?? "")
        let fromAccountEntity = accountRepo.getAccountEntityFromId(id: recordData.fromAccount?.id ?? "")

        newRecord.category = categoryEntity
        newRecord.account = accountEntity
        newRecord.fromAccount = fromAccountEntity

       
        let isRecordCreated = manager.save()
      
        if isRecordCreated == false{
            return false
        }

        if isRecordCreated {
            _ = updateAccountsByRecordData(recordData: recordData)
        }

        return isRecordCreated
    }

    func editRecord(recordData: RecordData) -> Bool {
       // _ = getRecordEntityById(id: recordData.id)
        return true
    }

    func deleteRecord(recordData: RecordData) -> Bool {
        guard let deletedEntity = getRecordEntityFromId(id: recordData.id) else {
            return false
        }
        let recordData = deletedEntity.toRecorData()
        manager.context.delete(deletedEntity)
        let isSuccess = manager.save()
        if isSuccess {
            onDeleteAction(recordData: recordData)
        }

        return isSuccess
    }
}

extension CDRecordRepository {
    func updateAccountsByRecordData(recordData: RecordData) -> Bool {
        
        let recordType = RecordTypeEnum(rawValue: recordData.recordType)
        let accountId : String = recordData.account?.id ?? ""
        let fromAccountId : String = recordData.fromAccount?.id ?? ""
        let amount = recordData.amount
        
        switch recordType {
        case .INCOME:
             return accountRepo.AddAmount(amount: recordData.amount, id: accountId)
        case .EXPENSE:
            return accountRepo.RemoveAmount(amount: recordData.amount, id: accountId)
        case .TRANSFER:
            let isAddAmountSuccess = accountRepo.AddAmount(amount: recordData.amount, id: accountId)
            let isRemoveAmountSuccess = accountRepo.RemoveAmount(amount: recordData.amount, id: fromAccountId)
            return isAddAmountSuccess && isRemoveAmountSuccess
        case .none:
            return false
        }
    }
}

extension CDRecordRepository {
    func onDeleteAction(recordData: RecordData) {
        let amount = recordData.amount
        let type = RecordTypeEnum(rawValue: recordData.recordType)

        // If deleted account type is Income, Remove the amount on that account
        // If deleted account type is Expense, Add the amount on that account
        // For transfer, add amount in from account and decrease amount from amount
        if type == .INCOME {
            _ = accountRepo.RemoveAmount(amount: amount, id: recordData.account?.id ?? "")
        } else if type == .EXPENSE {
            _ = accountRepo.AddAmount(amount: amount, id: recordData.account?.id ?? "")
        } else if type == .TRANSFER {
            _ = accountRepo.AddAmount(amount: amount, id: recordData.fromAccount?.id ?? "")
            _ = accountRepo.RemoveAmount(amount: amount, id: recordData.account?.id ?? "")
        }
    }
}
