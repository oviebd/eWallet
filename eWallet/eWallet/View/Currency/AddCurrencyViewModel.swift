//
//  CurrencyViewModel.swift
//  eWallet
//
//  Created by Habibur Rahman on 27/5/24.
//

import Foundation

class AddCurrencyViewModel : ObservableObject {
    
   // var repository : CurrencyDataRepository
    
    @Published var title: String = ""
    @Published var symbol: String = ""
    @Published var short_code: String = ""
    
    var currencyRepo : CurrencyDataRepository
    
//    let currency1 = CurrencyData(title: "Dolar", symbol: "$", icon: "D", short_code: "0123")
//    let currency2 = CurrencyData(title: "Taka", symbol: "#", icon: "T", short_code: "0550")
    
    init() {
        
        currencyRepo = CurrencyDataRepository.shared
        currencyRepo.setProtocol(currencyRepo: CDCurrencyRepository())
       
        //getCurrency()
    }
    
    func getCurrency () ->  [CurrencyData] {
        return currencyRepo.getCurrency()
    }
    
    func createCurrency() {
        let currency = CurrencyData(title: title, symbol: symbol, icon: "D", short_code: short_code)
        let _ = currencyRepo.addCurrency(currencyData: currency)
    //    getCurrency()
        
    }
}
