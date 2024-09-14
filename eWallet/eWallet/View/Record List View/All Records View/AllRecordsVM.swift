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
    
    @Published var filteredData : RecordFilterData = RecordFilterData()
   // @Published var chartDatas : [Date:String] = [Date:String]()
    
    private var cancellables = Set<AnyCancellable>()
    
    
    
    init() {
        recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository())
        $filteredData.sink { [weak self] value in
            self?.recordListByDateData = RecordListByDateData()
            self?.recordsList = self?.recordRepo.getFilteredDatas(recordFilterData: value) ?? []
            self?.recordListByDateData.prepareDatas(datas: self?.recordsList ?? [])
            
        }.store(in: &cancellables)
    }
    
    deinit {
        cancellables.removeAll()
    }
    
}
