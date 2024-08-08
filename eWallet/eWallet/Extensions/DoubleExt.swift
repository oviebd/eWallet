//
//  DoubleExt.swift
//  eWallet
//
//  Created by Habibur Rahman on 29/7/24.
//

import Foundation

extension Double {
    
    func to2Decimal() -> String {
       
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        let formattedAmount = formatter.string(from: self as NSNumber)!
        print(formattedAmount) // 10
        
        return formattedAmount //String(format: "%.2f", self)
    }
    
    func toAmountTextWithCurrency(currency : CurrencyData?) -> String{
        let valueWith2Decimal = self.to2Decimal()
        if let currencyCode = currency?.short_code {
            return "\(currencyCode)  \(valueWith2Decimal)"
        }
        
        return valueWith2Decimal
    }
    
    func toString() -> String{
        return "\(self)"
    }
}
