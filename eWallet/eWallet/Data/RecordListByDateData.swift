//
//  RecordListByDateData.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/8/24.
//

import Foundation

class RecordListByDateData {
    
    let todayRecordList = DummyDataUtils.todayRecordList
    let yesterDayRecordList = DummyDataUtils.yesterdayRecordList
    
    var dataByDateDic : [Date: [RecordData]] = [:]
    
//    init() {
//        let allDatsList = todayRecordList + yesterDayRecordList
//        let recordListByDate = RecordListByDateData()
//        recordListByDate.prepareDatas(datas: DummyDataUtils.todayRecordList +  DummyDataUtils.yesterdayRecordList)
//        dataByDateDic = recordListByDate.dataByDateDic
//    }
    
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

