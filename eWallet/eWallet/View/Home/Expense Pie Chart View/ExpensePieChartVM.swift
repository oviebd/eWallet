//
//  ExpensePieChartVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 14/9/24.
//

import Foundation
import Combine


class ExpensePieChartVM : ObservableObject {
    
    
    var recordRepo: RecordDataRepository
    @Published var expensePieChartDataOf30Days: PieChartData = PieChartData(datas: [])
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository())
        initAccountSubscription()
    }

    func initAccountSubscription(){
       
        recordRepo.$isRecordDbChanged.sink { [weak self] isChanged in
            DispatchQueue.main.async {
                self?.fetchData()
            }
          
        }.store(in: &cancellables)
    }
    
    private func fetchData(){
        let recordList = recordRepo.getFilteredDatas(recordFilterData: RecordFilterData(type: .day_30))
        expensePieChartDataOf30Days = UtiltyHelper.preparePieChartDataFrom(recordList: recordList,recordType: .EXPENSE)
    }
    
    deinit {
        cancellables.removeAll()
    }
}
