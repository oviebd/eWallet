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
        let _ = recordRepo.getRecords()
        recordRepo.$recordList.sink { [weak self] recordList in
            DispatchQueue.main.async {
                self?.expensePieChartDataOf30Days = UtiltyHelper.preparePieChartDataFrom(recordList: recordList)
            }
          
        }.store(in: &cancellables)
    }
    deinit {
        cancellables.removeAll()
    }
}
