//
//  CurrencyListVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 2/7/24.
//

import Foundation
import Combine

class CurrencyListVM : ObservableObject {
    

    let currencyRepo : CurrencyDataRepository
    @Published var currencyDatas = [CurrencyData]()
    @Published var isAddCurrencyPressed : Bool = false
    
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        currencyRepo = CurrencyDataRepository.shared(currencyRepo: CDCurrencyRepository())
        initCurrencySubscription()
    }
    
//    deinit {
//        cancellables.removeAll()
//    }
    
    func initCurrencySubscription(){
        let _ = currencyRepo.getCurrency()
        currencyRepo.$currencyList.sink { [weak self] currencyList in
           self?.currencyDatas = currencyList
        }.store(in: &cancellables)
    }
    
}
