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
    @Published var chartData : BarChartData = BarChartData()
    
    @Published var goRecordScreen: Bool = false
    @Published var selectedRecordData: RecordData?
    
    private var cancellables = Set<AnyCancellable>()
    
    
    
    init() {
        recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository())
        chartData.datas = ChartDataUtility.chartDataList
        
        recordRepo.$isRecordDbChanged.sink { _ in
            DispatchQueue.main.async {
                self.fetchDataFrom(filterData: self.filteredData)
            }
            
        }.store(in: &cancellables)
        
        
        $filteredData.sink { [weak self] value in
            DispatchQueue.main.async {
                self?.fetchDataFrom(filterData: value)
            }
            
        }.store(in: &cancellables)
        
       
    }
    
    private func fetchDataFrom(filterData: RecordFilterData) {
        recordsList = recordRepo.getFilteredDatas(recordFilterData: filterData)
        recordListByDateData.prepareDatas(datas: recordsList)
        chartData = UtiltyHelper.prepareBarChartDataFrom(recordList: recordsList)
    }
    
    deinit {
        cancellables.removeAll()
    }
    
}
