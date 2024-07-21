//
//  AddRecordDetailsVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 21/7/24.
//

import Foundation


struct RecordDetailsData {
    var note : String
    var date : Date
    var time : Date
}

class AddRecordDetailsVM : ObservableObject {
  
    @Published var noteText : String = ""
    @Published var selectedDate = Date.now
    @Published var selectedTime = Date.now
    
    func prepareRecordDetailsData (){
        
    }
}
