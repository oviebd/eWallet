//
//  AccountListVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 12/7/24.
//

import Foundation
import Combine

class AccountGridVM : ObservableObject {
    
    private var accountRepo: AccountDataRepository
    private var recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository())
    @Published var accountList : [AccountData] = [AccountData]()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        accountRepo = AccountDataRepository.shared(accountRepo: CDAccountRepository())
        initAccountSubscription()
        initRecordSubscription()
    }


    func initRecordSubscription(){
            let _ = recordRepo.getRecords()
            recordRepo.$recordList.sink { [weak self] recordList in
                DispatchQueue.main.async {
                    self?.accountList = self?.accountRepo.getAccounts() ?? []
                }
              
            }.store(in: &cancellables)
        }

    func initAccountSubscription(){
        let _ = accountRepo.getAccounts()
        accountRepo.$accountList.sink { [weak self] accountList in
            DispatchQueue.main.async {
                self?.accountList = accountList
            }
          
        }.store(in: &cancellables)
    }
    deinit {
        cancellables.removeAll()
    }
}
