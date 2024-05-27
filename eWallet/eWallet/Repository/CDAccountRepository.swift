//
//  CDAccountRepository.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/5/24.
//

import Foundation
import CoreData

struct AccountData : Hashable , Identifiable{
    var id: String  = UUID().uuidString
    var title: String
    var amount: Double
}

extension AccountEntity {
    func convertToAccountData() -> AccountData {
        return AccountData(id: self.id ?? "", title: self.title ?? "", amount: self.amount )
    }
}

struct CDAccountRepository {
    
    let manager = CoreDataManager.instance
    
    func getAccounts() -> [AccountData] {
        
        var accounts = [AccountData]()
        
        let request = NSFetchRequest<AccountEntity>(entityName: Constants.CORE_DATA.AccountEntity)
        do {
            let accountsDatas = try manager.context.fetch(request)
            
            for account in accountsDatas {
                let a = account.convertToAccountData()
                // print(c.title)
                accounts.append(a)
            }
            
        } catch {
            print("Error Fetching.. \(error.localizedDescription)")
        }
        
        return accounts
    }
    
    
    func addAccount(account: AccountData) {
        let newAccount  = AccountEntity(context: manager.context)
        newAccount.title = account.title
        newAccount.amount = account.amount
        newAccount.id = account.id
       // newAccount.colorCode = account.color.toHex()

        // print("U>> Color Code \(category.color.toHex())")

        save()
    }
    
    func save() {
        self.manager.save()
    }
}
