//
//  AccountListVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 12/7/24.
//

import Foundation

class AccountListVM : ObservableObject {
    
    private var accountRepo: AccountDataRepository
    @Published var accountList : [AccountData] = [AccountData]()
    
    init() {
        accountRepo = AccountDataRepository(accountRepo: CDAccountRepository())
        getAccounts()
    }
    
    func getAccounts(){
        accountList = accountRepo.getAccounts()
    }
    
}
