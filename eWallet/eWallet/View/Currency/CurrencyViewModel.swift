//
//  CurrencyViewModel.swift
//  eWallet
//
//  Created by Habibur Rahman on 27/5/24.
//

import Foundation

class CurrencyViewModel : ObservableObject {
    
    var repository = CDCurrencyRepository()
    
    @Published var title: String = ""
    @Published var symbol: String = ""
    @Published var short_code: String = ""
    
//    let currency1 = CurrencyData(title: "Dolar", symbol: "$", icon: "D", short_code: "0123")
//    let currency2 = CurrencyData(title: "Taka", symbol: "#", icon: "T", short_code: "0550")
    
    init() {
        getCurrency()
    }
    
    func getCurrency () ->  [CurrencyData] {
        return repository.getCurrency()
    }
    
    func createCurrency() {
        let currency = CurrencyData(title: title, symbol: symbol, icon: "D", short_code: short_code)
        repository.addCurrency(currency: currency)
        getCurrency()
        
    }
}
