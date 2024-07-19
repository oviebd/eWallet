//
//  AccountListVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 12/7/24.
//

import Foundation
import Combine

class AccountListVM : ObservableObject {
    
    private var accountRepo: AccountDataRepository
    @Published var accountList : [AccountData] = [AccountData]()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        accountRepo = AccountDataRepository.shared(accountRepo: CDAccountRepository())
       
        initAccountSubscription()
    }



    func initAccountSubscription(){
        let _ = accountRepo.getAccounts()
        accountRepo.$accountList.sink { [weak self] accountList in
           self?.accountList = accountList
        }.store(in: &cancellables)
    }
    deinit {
        cancellables.removeAll()
    }
}
