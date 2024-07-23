//
//  AddRecordDetailsVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 21/7/24.
//

import Foundation


struct AdditionalRecordData {
    var note : String
    var date : Date
    var time : Date
    
    func printData (){
        print("Note \(note) date \(date) time \(time)")
    }
}

class AddRecordDetailsVM : ObservableObject {
  
    @Published var noteText : String = ""
    @Published var selectedDate = Date.now
    @Published var selectedTime = Date.now
    
   // @Published var additionalRecordData : AdditionalRecordData
    
    
    init() {
     //   self.additionalRecordData = additionalRecordData
        setInitData()
        
    }
    
    func setInitData(){
   //     noteText = additionalRecordData.note
//        selectedDate = additionalRecordData?.date
//        selectedTime = additionalRecordData?.time
    }
    
    func prepareRecordDetailsData (){
        
  //      additionalRecordData.note = noteText
//        additionalRecordData.time = selectedTime
//        additionalRecordData.date = selectedDate
    }
    
    
}
