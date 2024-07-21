//
//  CDCurrencyRepository.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/5/24.
//

import Foundation
import CoreData


extension CurrencyEntity {
    func convertToCurrencyData() -> CurrencyData {
        return CurrencyData(id: self.id ?? "", title: self.title ?? "", symbol: self.symbol ?? "", icon: self.icon ?? "", short_code: self.short_code ?? "")
    }
}

struct CDCurrencyRepository : CurrencyDataRepoProtocol {

    let manager = CoreDataManager.instance
    
    private func getCurrencyEntityList() -> [CurrencyEntity] {
        let request = NSFetchRequest<CurrencyEntity>(entityName: Constants.CORE_DATA.CurrencyEntity)
        do {
            let currencyDatas = try manager.context.fetch(request)
            
           return currencyDatas
            
        } catch {
            print("Error Fetching.. \(error.localizedDescription)")
        }
        return  [CurrencyEntity]()
    }
    
    func getCurrency() -> [CurrencyData] {
        
        var currency = [CurrencyData]()
        
        for currencies in getCurrencyEntityList() {
            let a = currencies.convertToCurrencyData()
            print( "U>> Currency \(a.title)")
            currency.append(a)
        }
        return currency
    }
    
    func addCurrency(currencyData: CurrencyData) -> Bool {
        let newCurrency  = CurrencyEntity(context: manager.context)
        newCurrency.title = currencyData.title
        newCurrency.symbol = currencyData.symbol
        newCurrency.id = currencyData.id
        newCurrency.icon = currencyData.icon
        newCurrency.short_code = currencyData.short_code
        // print("U>> Color Code \(category.color.toHex())")

        return save()
    }
    
    func getCurrencyEntityFromID(id: String) -> CurrencyEntity? {
        
        let currencyList = getCurrencyEntityList()
        
        for currency in currencyList {
            if currency.id == id{
                return currency
            }
        }
        return nil
    }
    
    
    
    func save() -> Bool {
        return self.manager.save()
    }
}

