//
//  CurrencyListVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 2/7/24.
//

import Foundation
import Combine

class CurrencyListVM : ObservableObject {
    

    let currencyRepo = CurrencyDataRepository.shared
    @Published var currencyDatas = [CurrencyData]()
    @Published var isAddCurrencyPressed : Bool = false
    
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        currencyRepo.setProtocol(currencyRepo: CDCurrencyRepository())
        initCurrencySubscription()
    }
    
    func initCurrencySubscription(){
        currencyRepo.$currencyList.sink { [weak self] currencyList in
           self?.currencyDatas = currencyList
        }.store(in: &cancellables)
    }
    
}
