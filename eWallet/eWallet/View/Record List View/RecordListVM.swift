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
        initSubscription()
    }

    func initSubscription(){
        
        recordRepo.$isRecordDbChanged.sink { [weak self] isChanged in
            DispatchQueue.main.async {
                self?.fetchData()
            }
        }.store(in: &cancellables)
    }
    
    func fetchData(){
        recordsList = recordRepo.getRecords()
        recordsList = Array(recordsList.prefix(3))
    }
    deinit {
        cancellables.removeAll()
    }
    
}
