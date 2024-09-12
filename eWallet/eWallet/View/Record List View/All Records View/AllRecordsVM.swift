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
    @Published var chartDatas : [Date:String] = [Date:String]()
    
    private var cancellables = Set<AnyCancellable>()
    
    
    
    init() {
        recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository())
       
      //  initAccountSubscription()
        
        $filteredData.sink { [weak self] value in
            self?.recordListByDateData = RecordListByDateData()
            self?.recordsList = self?.recordRepo.getFilteredDatas(recordFilterData: value) ?? []
            self?.recordListByDateData.prepareDatas(datas: self?.recordsList ?? [])
            self?.chartDatas = self?.recordListByDateData.getChartData() ?? [Date:String]()
          //  self?.recordListByDateData.dataByDateDic.sorted(by: {$0.key < $1.key})
            
        }.store(in: &cancellables)
    }

//    func initAccountSubscription(){
//        let _ = recordRepo.getFilteredDatas(recordFilterData: filteredData)//getRecords()
//        recordRepo.$recordList.sink { [weak self] recordList in
//            DispatchQueue.main.async {
//                self?.recordListByDateData = RecordListByDateData()
//                self?.recordsList = recordList
//                self?.recordListByDateData.prepareDatas(datas: recordList)
//            }
//          
//        }.store(in: &cancellables)
//    }
    deinit {
        cancellables.removeAll()
    }
    
}
