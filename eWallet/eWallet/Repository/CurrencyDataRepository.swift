//
//  CurrencyDataRepository.swift
//  eWallet
//
//  Created by Habibur Rahman on 30/6/24.
//

import Foundation


struct CurrencyData : Hashable , Identifiable {
    var id: String  = UUID().uuidString
    var title: String
    var symbol: String
    var icon: String
    var short_code: String
    
    func toCurrencyEntity() -> CurrencyEntity {
        let manager = CoreDataManager.instance
        let entity  = CurrencyEntity(context: manager.context)
        entity.title = self.title
        entity.symbol = self.symbol
        entity.id = self.id
        entity.icon = self.icon
        entity.short_code = self.short_code
        
        return entity
    }
}

protocol CurrencyDataRepoProtocol{
    func getCurrency() -> [CurrencyData]
    func addCurrency(currencyData: CurrencyData) -> Bool
}

class CurrencyDataRepository {
   
    var currencyRepo : CurrencyDataRepoProtocol?
    @Published var currencyList = [CurrencyData]()
   
    static let shared = CurrencyDataRepository()
    
    private init() {
        //self.currencyRepo = currencyRepo
    }
    
    func setProtocol(currencyRepo: CurrencyDataRepoProtocol){
        self.currencyRepo = currencyRepo
    }
    
    
    func getCurrency() -> [CurrencyData] {
        currencyList = currencyRepo?.getCurrency() ?? [CurrencyData]()
       return currencyList//accountRepo.getAccounts()
    }
    
    func addCurrency(currencyData : CurrencyData) -> Bool {
        let isSuccess = currencyRepo?.addCurrency(currencyData: currencyData) ?? false
        if isSuccess{
            getCurrency()
        }
        return isSuccess
    }
    
}

