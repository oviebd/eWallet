//
//  RecordsListByAccountVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 13/9/24.
//

import Foundation
import Combine

class RecordsListByAccountVM : ObservableObject {
    
    var recordRepo : RecordDataRepository
    @Published var recordsList : [RecordData] = [RecordData]()
    
    @Published var recordListByDateData : RecordListByDateData = RecordListByDateData()
    
    @Published var filteredData : RecordFilterData = RecordFilterData()
    @Published var chartData : ChartData = ChartData()
    
    private var cancellables = Set<AnyCancellable>()
    
    
    
    init() {
        recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository())
        chartData.datas = ChartDataUtility.chartDataList
        
        
        $filteredData.sink { [weak self] value in
            self?.recordListByDateData = RecordListByDateData()
            self?.recordsList = self?.recordRepo.getFilteredDatas(recordFilterData: value) ?? []
            self?.recordListByDateData.prepareDatas(datas: self?.recordsList ?? [])
            self?.chartData = self?.recordListByDateData.getChartData(datas: self?.recordsList ?? []) ?? ChartData(datas: [])
        
            
        }.store(in: &cancellables)
    }
    
    
    deinit {
        cancellables.removeAll()
    }
    
}
