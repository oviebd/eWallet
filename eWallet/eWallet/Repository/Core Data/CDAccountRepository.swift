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
                           currencyData: self.currency?.convertToCurrencyData(),
                           amount: amount)
    }
}

struct CDAccountRepository: AccountDataRepoProtocol {
    let manager = CoreDataManager.instance

    func getAccounts() -> [AccountData] {
        var accounts = [AccountData]()

        let request = NSFetchRequest<AccountEntity>(entityName: Constants.CORE_DATA.AccountEntity)
        do {
            let accountsDatas = try manager.context.fetch(request)

            for account in accountsDatas {
                let a = account.convertToAccountData()
                print(a.title)
                print(a.amount)
                accounts.append(a)
            }

        } catch {
            print("Error Fetching.. \(error.localizedDescription)")
        }

        return accounts
    }

    func addAccount(account: AccountData) -> Bool {
        let newAccount = AccountEntity(context: manager.context)
        newAccount.title = account.title
        newAccount.amount = account.amount
        newAccount.id = account.id
        newAccount.currency = account.currencyData?.toCurrencyEntity()
        // newAccount.colorCode = account.color.toHex()

        // print("U>> Color Code \(category.color.toHex())")

        return  manager.save()
    }
}
