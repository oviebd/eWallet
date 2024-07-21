//
//  HomeVm.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/5/24.
//

import Foundation

class HomeVm: ObservableObject {
  
    @Published var isCreateAccountButtonPressed: Bool = false
    @Published var isCreateRecordButtonPressed: Bool = false

    func onAccountListButtonPressed(buttonType: AccountsListViewButtonTypeEnum) {
        switch buttonType {
        case .AccounDetails:
            break

        case .AddAccount:
            isCreateAccountButtonPressed = true
            break
        case .Records:
            break
        }
    }
}
