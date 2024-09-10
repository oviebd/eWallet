//
//  RecordListByDateData.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/8/24.
//

import Foundation

class RecordListByDateData {
    var dataByDateDic : [Date: [RecordData]] = [:]
    
    func prepareDatas(datas: [RecordData]){
        for data in datas {
            
            let date = data.date.removeTime()
            
           // print("U>> Date is \(date.description)")
            
            if dataByDateDic[date] == nil {
                dataByDateDic[date] = [data]
            }else{
                var recordList : [RecordData] = (dataByDateDic[date] ?? [])
                recordList.append(data)
                dataByDateDic[date] = recordList
            }
        }
        
//        let sortedByKey = dataByDateDic.sorted { $0.key > $1.key }
//        //print("sorted keys \(sortedByKey)")
//        dataByDateDic = Dictionary(uniqueKeysWithValues: sortedByKey)
//        print(dataByDateDic.keys)
        
    }
}

