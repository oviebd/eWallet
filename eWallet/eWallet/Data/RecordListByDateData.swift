//
//  RecordListByDateData.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/8/24.
//

import Foundation

class RecordListByDateData {
   
    var dataByDateDic: [Date: [RecordData]] = [:]
 //   var dataByDateDic: [Date: [RecordData]] = [:]
    
    func prepareDatas(datas: [RecordData]) {
       dataByDateDic = [:]
        for data in datas {
            let date = data.date.removeTime()

            // print("U>> Date is \(date.description)")

            if dataByDateDic[date] == nil {
                dataByDateDic[date] = [data]
            } else {
                var recordList: [RecordData] = (dataByDateDic[date] ?? [])
                recordList.append(data)
                dataByDateDic[date] = recordList
            }
        }

//        let sortedByKey = dataByDateDic.sorted { $0.key > $1.key }
//        //print("sorted keys \(sortedByKey)")
//        dataByDateDic = Dictionary(uniqueKeysWithValues: sortedByKey)
//        print(dataByDateDic.keys)
    }
    
    func getChartData(datas: [RecordData]) -> ChartData {
    
        prepareDatas(datas: datas)
        var singleChartDatas : [SingleChartData] = [SingleChartData]()
        
        for (key, value) in dataByDateDic {

            let records : [RecordData] = dataByDateDic[key] ?? [RecordData]()
           
            var amount = 0.0
            for record in records {
                amount += record.amount
            }
            singleChartDatas.append(SingleChartData(date: key, value: amount))
          //  datas.append(chartData)
        }
        let chartData = ChartData(datas: singleChartDatas)
        print("U>> axix values \(singleChartDatas)")
        return chartData
    }
}


