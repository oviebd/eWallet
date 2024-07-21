//
//  AccountListVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 21/7/24.
//

import Foundation
import Combine

class AccountListVM : ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    private var accountRepo: AccountDataRepository
    @Published var accountList : [AccountData] = [AccountData]()
 
    @Published var isAddAccountPressed : Bool = false

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
