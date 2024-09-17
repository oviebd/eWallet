//
//  CashFlowVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 17/9/24.
//

import Foundation
import Combine

class CashFlowVM : ObservableObject {
  
    @Published var cashFlowData: CashFlowData = CashFlowData(expenseAmount: 0.0, incomeAmount: 0.0)
   
    private var recordRepo: RecordDataRepository
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
        cashFlowData = UtiltyHelper.prepareCashFlowDataFrom(recordList: recordList)
    }
    
    deinit {
        cancellables.removeAll()
    }
}
