//
//  RecordDataRepository.swift
//  eWallet
//
//  Created by Habibur Rahman on 23/7/24.
//

import Foundation
import SwiftUI

struct RecordData: Hashable, Identifiable {
    var id: String = UUID().uuidString
    var note: String
    var recordType: String
    var amount: Double
    var date: Date
    var catagory: CategoryData?
    var account: AccountData?
    var fromAccount: AccountData?
}

protocol RecordDataRepoProtocol {
    func getRecords() -> [RecordData]
    func getRecordFromId(id : String) -> RecordData?
    func getRecodrdsFrom(account: AccountData) -> [RecordData]
    func addRecord(recordData: RecordData) -> Bool
    func editRecord(recordData: RecordData) -> Bool
    func deleteRecord(recordData: RecordData) -> Bool
    
    func getFilteredDatas(recordFilterData : RecordFilterData) -> [RecordData]
}

class RecordDataRepository {
    private static var sharedInstance: RecordDataRepository!

    var recordRepo: RecordDataRepoProtocol
    @Published var recordList = [RecordData]()

    private init(recordRepo: RecordDataRepoProtocol) {
        self.recordRepo = recordRepo
    }

    static func shared(recordRepo: RecordDataRepoProtocol) -> RecordDataRepository {
        if sharedInstance == nil {
            sharedInstance = RecordDataRepository(recordRepo: recordRepo)
        } else {
            sharedInstance.recordRepo = recordRepo
        }

        return sharedInstance
    }
    
    func getRecordFromId(id: String) -> RecordData? {
        return recordRepo.getRecordFromId(id: id)
    }

    func getRecords() -> [RecordData] {
        recordList = recordRepo.getRecords()
        return recordList
    }
    
    func getFilteredDatas(recordFilterData : RecordFilterData) -> [RecordData] {
        return recordRepo.getFilteredDatas(recordFilterData: recordFilterData)
    }

    func addRecord(recordData: RecordData) -> Bool {
        let isSuccess = recordRepo.addRecord(recordData: recordData)
        if isSuccess {
            let _ = getRecords()
        }
        return isSuccess
    }
    
    func editRecord(recordData: RecordData) -> Bool {
        let isSuccess = recordRepo.editRecord(recordData: recordData)
        if isSuccess {
            let _ = getRecords()
        }
        return isSuccess
    }
    
    func deleteRecord(recordData: RecordData) -> Bool{
        let isSuccess = recordRepo.deleteRecord(recordData: recordData)
        if isSuccess {
            let _ = getRecords()
        }
        return isSuccess
    }
}
