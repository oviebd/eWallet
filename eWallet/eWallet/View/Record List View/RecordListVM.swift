//
//  RecordListVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 29/7/24.
//

import Foundation
import Combine

class RecordListVM : ObservableObject {
    
    var recordRepo : RecordDataRepository
    @Published var recordsList : [RecordData] = [RecordData]()
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
            }
          
        }.store(in: &cancellables)
    }
    deinit {
        cancellables.removeAll()
    }
    
}
