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
  
    @Published var goRecordScreen: Bool = false
    @Published var selectedRecordData : RecordData?
    
    @Published var searchText: String = ""
    private var cancellables = Set<AnyCancellable>()
    
    
    
    init() {
        recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository())
        
        
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] newText in
                if  self?.searchText.isEmptyString() == false{
                    self?.filteredData.searchText = self?.searchText
                }else{
                    self?.filteredData.searchText = nil
                }
                
            }
            .store(in: &cancellables)
        
        
        $filteredData.sink { [weak self] value in

            self?.recordsList = self?.recordRepo.getFilteredDatas(recordFilterData: value) ?? []
            self?.recordListByDateData.prepareDatas(datas: self?.recordsList ?? [])
            
        }.store(in: &cancellables)
    }
    
    deinit {
        cancellables.removeAll()
    }
    
}
