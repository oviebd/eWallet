//
//  UtiltyHelper.swift
//  eWallet
//
//  Created by Habibur Rahman on 29/7/24.
//

import Foundation

class UtiltyHelper {
    static func prepareRecordDataByDates(datas: [RecordData]) -> [Date: [RecordData]] {
        var dataByDateDic: [Date: [RecordData]] = [:]
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

        return dataByDateDic
    }

    static func prepareBarChartDataFrom(recordList: [RecordData]) -> BarChartData {
        var dataByDateDic = prepareRecordDataByDates(datas: recordList)
        var singleChartDatas: [SingleBarChartData] = [SingleBarChartData]()

        for i in 0 ..< 30 {
            let key: Date = .now.dayBefore(dayNumber: 30 - i)?.removeTime() ?? .now.removeTime()
            var amount = 0.0
            if let records = dataByDateDic[key] {
                for record in records {
                    amount += record.amount
                }
            }
            singleChartDatas.append(SingleBarChartData(date: key, value: amount))
        }
        let chartData = BarChartData(datas: singleChartDatas)
        return chartData
    }

    static func preparePieChartDataFrom(recordList: [RecordData],recordType : RecordTypeEnum? = nil) -> PieChartData {
      
        var pieDataDic: [String: SinglePieChartData] = [:]

        for record in recordList {
            
            if let type = recordType, type.rawValue !=  record.recordType {
                continue
            }
            
            let key: String = record.catagory?.id ?? ""
            if pieDataDic[key] == nil {
                pieDataDic[key] = SinglePieChartData(id: key, key: record.catagory?.title ?? "", value: record.amount)
            } else {
                if let data = pieDataDic[key] {
                    pieDataDic[key] = SinglePieChartData(id: data.id, key: data.key, value: data.value + record.amount)
                }
            }
        }

        var singleBarDatas: [SinglePieChartData] = [SinglePieChartData]()
        for (key, _) in pieDataDic {
            if let data = pieDataDic[key] {
                singleBarDatas.append(data)
            }
        }

        return PieChartData(datas: singleBarDatas)
    }
    
    static func prepareCashFlowDataFrom(recordList: [RecordData]) -> CashFlowData {
        var income = 0.0
        var expense = 0.0
        for record in recordList {
            if record.recordType == RecordTypeEnum.EXPENSE.rawValue {
                expense += record.amount
            }
            else if record.recordType == RecordTypeEnum.INCOME.rawValue {
                income += record.amount
            }
        }
        return CashFlowData(expenseAmount: expense, incomeAmount: income)
    }
}
