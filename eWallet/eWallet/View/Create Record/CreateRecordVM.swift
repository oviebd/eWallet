//
//  CreateRecordVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 19/7/24.
//

import Foundation

class CreateRecordVM : ObservableObject {
    
    @Published var amountInput = "0"
    @Published var isAccountTypePressed = false
    @Published var isSelectCategoryPressed = false
    @Published var isDetailsBtnPressed = false
    
    @Published var selectedAccountData : AccountData?
    @Published var selectedCategoryData : CategoryData?
    
    @Published var alertModel = AlertDataUtils.alertDmmyDataSingleButton
    @Published var showingAlert = false
    @Published var isAccountCreated = false
    
    func onSaveBtnPressed(){
        
    }
    
}
