//
//  CDCurrencyRepository.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/5/24.
//

import Foundation
import CoreData

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

extension CurrencyEntity {
    func convertToCurrencyData() -> CurrencyData {
        return CurrencyData(id: self.id ?? "", title: self.title ?? "", symbol: self.symbol ?? "", icon: self.icon ?? "", short_code: self.short_code ?? "")
    }
}

struct CDCurrencyRepository {
    
    let manager = CoreDataManager.instance
    
    func getCurrency() -> [CurrencyData] {
        
        var currency = [CurrencyData]()
        
        let request = NSFetchRequest<CurrencyEntity>(entityName: Constants.CORE_DATA.CurrencyEntity)
        do {
            let currencyDatas = try manager.context.fetch(request)
            
            for currencies in currencyDatas {
                let a = currencies.convertToCurrencyData()
                print( "U>> Currency \(a.title)")
                currency.append(a)
            }
            
        } catch {
            print("Error Fetching.. \(error.localizedDescription)")
        }
        
        return currency
    }
    
    func addCurrency(currency: CurrencyData) {
        let newCurrency  = CurrencyEntity(context: manager.context)
        newCurrency.title = currency.title
        newCurrency.symbol = currency.symbol
        newCurrency.id = currency.id
        newCurrency.icon = currency.icon
        newCurrency.short_code = currency.short_code
        
       
        // print("U>> Color Code \(category.color.toHex())")

        save()
    }
    
    func save() {
        self.manager.save()
    }
}

