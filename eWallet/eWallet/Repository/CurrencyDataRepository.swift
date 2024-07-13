//
//  CurrencyDataRepository.swift
//  eWallet
//
//  Created by Habibur Rahman on 30/6/24.
//

import Foundation

struct CurrencyData: Hashable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var symbol: String
    var icon: String
    var short_code: String

    func toCurrencyEntity() -> CurrencyEntity {
        let manager = CoreDataManager.instance
        let entity = CurrencyEntity(context: manager.context)
        entity.title = title
        entity.symbol = symbol
        entity.id = id
        entity.icon = icon
        entity.short_code = short_code

        return entity
    }
}

protocol CurrencyDataRepoProtocol {
    func getCurrency() -> [CurrencyData]
    func addCurrency(currencyData: CurrencyData) -> Bool
    func getCurrencyEntityFromID(id: String) -> CurrencyEntity?
}

class CurrencyDataRepository {
    private static var sharedInstance: CurrencyDataRepository!

    var currencyRepo: CurrencyDataRepoProtocol
    @Published var currencyList = [CurrencyData]()

    private init(currencyRepo: CurrencyDataRepoProtocol) {
        self.currencyRepo = currencyRepo
    }

    static func shared(currencyRepo: CurrencyDataRepoProtocol) -> CurrencyDataRepository {
        if sharedInstance == nil {
            sharedInstance = CurrencyDataRepository(currencyRepo: currencyRepo)
        } else {
            sharedInstance.currencyRepo = currencyRepo
        }

        return sharedInstance
    }

    func getCurrency() -> [CurrencyData] {
        currencyList = currencyRepo.getCurrency()
        return currencyList
    }

    func addCurrency(currencyData: CurrencyData) -> Bool {
        let isSuccess = currencyRepo.addCurrency(currencyData: currencyData)
        if isSuccess {
            let _ = getCurrency()
        }
        return isSuccess
    }

    func getCurrencyEntityFromId(id: String) -> CurrencyEntity? {
        return currencyRepo.getCurrencyEntityFromID(id: id)
    }
}
