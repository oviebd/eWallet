//
//  AccountDataRepository.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/5/24.
//

import Foundation


//struct CurrencyData: Hashable, Identifiable {
//    var id: String = UUID().uuidString
//    var title: String
//    var symbol: String
//    var icon: String
//    var short_code: String
//
//    func toCurrencyEntity() -> CurrencyEntity {
//        let manager = CoreDataManager.instance
//        let entity = CurrencyEntity(context: manager.context)
//        entity.title = title
//        entity.symbol = symbol
//        entity.id = id
//        entity.icon = icon
//        entity.short_code = short_code
//
//        return entity
//    }
//}

struct AccountData: Hashable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var currencyData: CurrencyData?
    var amount: Double
}

protocol AccountDataRepoProtocol {
    func getAccounts() -> [AccountData]
    func addAccount(account: AccountData) -> Bool
}

class AccountDataRepository {
    private static var sharedInstance: AccountDataRepository!

    var accountRepo: AccountDataRepoProtocol
    @Published var accountList = [AccountData]()

    private init(accountRepo: AccountDataRepoProtocol) {
        self.accountRepo = accountRepo
    }

    static func shared(accountRepo: AccountDataRepoProtocol) -> AccountDataRepository {
        if sharedInstance == nil {
            sharedInstance = AccountDataRepository(accountRepo: accountRepo)
        } else {
            sharedInstance.accountRepo = accountRepo
        }

        return sharedInstance
    }

    func getAccounts() -> [AccountData] {
        accountList = accountRepo.getAccounts()
        return accountList // accountRepo.getAccounts()
    }

    func addAccount(account: AccountData) -> Bool {
        let isSuccess = accountRepo.addAccount(account: account)
        if isSuccess {
            let _ = getAccounts()
        }
        return isSuccess
    }
}
