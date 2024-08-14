//
//  CDAccountRepository.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/5/24.
//

import CoreData
import Foundation

extension AccountEntity {
    func convertToAccountData() -> AccountData {
        return AccountData(id: id ?? "", title: title ?? "",
                           currencyData: currency?.convertToCurrencyData(),
                           amount: amount)
    }
}

struct CDAccountRepository: AccountDataRepoProtocol {
    
    let manager = CoreDataManager.instance

    
    private func getAccountEntityList() -> [AccountEntity] {
       
        let request = NSFetchRequest<AccountEntity>(entityName: Constants.CORE_DATA.AccountEntity)
        do {
            let accountsDatas = try manager.context.fetch(request)
            return accountsDatas
        } catch {
            print("Error Fetching.. \(error.localizedDescription)")
        }

        return  [AccountEntity]()
    }
    
    func getAccountEntityFromID(id: String) -> AccountEntity? {
        for account in getAccountEntityList() {
            if account.id == id {
                return account
            }
        }
        return nil
    }
    
    func getAccounts() -> [AccountData] {
        var accounts = [AccountData]()

        for account in getAccountEntityList() {
            let data = account.convertToAccountData()
          //  print( "U>> Currency \(a.title)")
            accounts.append(data)
        }
        return accounts
    }

    func addAccount(account: AccountData) -> Bool {
        let newAccount = AccountEntity(context: manager.context)
        newAccount.title = account.title
        newAccount.amount = account.amount
        newAccount.id = account.id

        let currencyRepo = CurrencyDataRepository.shared(currencyRepo: CDCurrencyRepository())
        newAccount.currency = currencyRepo.getCurrencyEntityFromId(id: account.currencyData?.id ?? "") // account.currencyData?.toCurrencyEntity()

        return manager.save()
    }
    
    func updatedAccount(account: AccountData?) -> Bool {
        
        guard var accountEntity = getAccountEntityFromID(id: account?.id ?? "") else {
            return false
        }
        
        accountEntity.title = account?.title
        accountEntity.amount = account?.amount ?? 0.0
        accountEntity.id = account?.id
        
        return manager.save()
    }
    
    func AddAmount(amount: Double, id: String) -> Bool {
        guard let accountEntity = getAccountEntityFromID(id: id) else {
            return false
        }
        accountEntity.amount += amount
        return manager.save()
    }
    
    func RemoveAmount(amount: Double, id: String) -> Bool {
        guard let accountEntity = getAccountEntityFromID(id: id) else {
            return false
        }
        accountEntity.amount -= amount
        return manager.save()
    }
    
    
    
}
