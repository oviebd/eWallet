//
//  ListData.swift
//  eWallet
//
//  Created by Habibur Rahman on 13/5/24.
//

import Foundation
import SwiftUI

struct RecordListDataModel : Hashable, Identifiable {
    var id: String = UUID().uuidString
    var title : String
    var totalExpense : String
    var balance : String
    
    var dataList : [RecordData]
}

//struct RecordData: Hashable, Identifiable {
//    var id: String = UUID().uuidString
//    var catagory: String
//    var accountName: String
//    var shortDescription: String
//    var amount: String
//    var date: String
//    var image: String
//    let color: Color
//}

class RecordDataUtility {
   
    var recordList = [RecordListDataModel]()
    
   // var reecordList: [RecordData] = [RecordData]()

    init() {
        
        anotherList()
        
        
      //  reecordList = prepareList()
    }

    func prepareList() -> [RecordData] {
       
        var dataList: [RecordData] = [RecordData]()
//        
//        let list1 = RecordData(id: "1", catagory: "Food & Drinks", accountName: "pocket money", shortDescription: "Fruits and other costs", amount: "-BDT 500.00", date: "Mar 14")
//        let list2 = RecordData(id: "2", catagory: "Charity,gifts", accountName: "pocket money", shortDescription: "To bua - 1k iftar and 1k jakat", amount: "_BDT 2000.00", date: "Mar 14", image: "gym.bag.fill", color: .green.opacity(0.8))
//        let list3 = RecordData(id: "3", catagory: "Gifts,joy", accountName: "pocket money", shortDescription: "Masik hatkkhoroch to ammu", amount: "-BDT 1500.00", date: "Mar 14", image: "gym.bag.fill", color: .lightBlue)
//        let list4 = RecordData(id: "4", catagory: "Financial expenses", accountName: "pocket money", shortDescription: "To abbu for faily cost", amount: "-BDT 7000.00", date: "Mar 14", image: "5.circle.fill", color: Color.theme.paste)
//        let list5 = RecordData(id: "5", catagory: "Transfer,withdraw", accountName: "Eastern Bank -> pocket money", shortDescription: "For family and zakat purpose", amount: "BDT 20000.00", date: "Mar 14", image: "arrow.left.arrow.right", color: Color.theme.teal)
//        let list6 = RecordData(id: "6", catagory: "Charges,Fees", accountName: "pocket money", shortDescription: "Net bill", amount: "-BDT 500.00", date: "Mar 12", image: "arrow.triangle.branch", color: Color.theme.paste)
//
//        dataList.append(list1)
//        dataList.append(list2)
//        dataList.append(list3)
//        dataList.append(list4)
//        dataList.append(list5)
//        dataList.append(list6)
        
        return dataList
    }
    
    func anotherList() {
//        let another1 = RecordListDataModel(title: "WEEK 10", totalExpense: "-BDT 22155.00", balance: "Balance BDT 7200.00",
//                                           dataList: [
//                                            RecordData(catagory: "Others", accountName: "pocket money", shortDescription: "Other costs", amount: "-BDT 8095.00", date: "Mar 10", image: "list.bullet", color: .gray)
//                                           ])
//       
//        let another2 = RecordListDataModel(title: "WEEK 14", totalExpense: "-BDT 16200.00", balance: "Balance BDT 5000.00", dataList: [RecordData(catagory: "Education, devlopment", accountName: "pocket money", shortDescription: "rent", amount: "-BDT 15000.00", date: "Mar 14", image: "pencil.line", color: .green.opacity(0.8))])
//        
//        let another0 = RecordListDataModel(title: "WEEK 9", totalExpense: "-BDT 16200.00", balance: "Balance BDT 5000.00", dataList: prepareList())
//        
//        recordList.append(another0)
//        recordList.append(another1)
//        recordList.append(another2)
        
    }
    
     
}
