//
//  AllRecordsVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 1/9/24.
//

import Foundation
import Combine

class AllRecordsVM : ObservableObject {
    
    var recordRepo : RecordDataRepository
    @Published var recordsList : [RecordData] = [RecordData]()
    
    @Published var recordListByDateData : RecordListByDateData = RecordListByDateData()
    
    private var cancellables = Set<AnyCancellable>()
    
    
    
    init() {
        recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository())
       
        initAccountSubscription()
    }

    func initAccountSubscription(){
        let _ = recordRepo.getRecords()
        recordRepo.$recordList.sink { [weak self] recordList in
            DispatchQueue.main.async {
                self?.recordsList = recordList
                self?.recordListByDateData.prepareDatas(datas: recordList)
            }
          
        }.store(in: &cancellables)
    }
    deinit {
        cancellables.removeAll()
    }
    
}
