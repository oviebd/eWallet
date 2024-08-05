//
//  RecordTypeEnum.swift
//  eWallet
//
//  Created by Habibur Rahman on 20/3/24.
//

import Foundation
enum RecordTypeEnum: String, CaseIterable, Identifiable {
    case INCOME 
    case EXPENSE
    case TRANSFER
    
    var id: Self { self }
    
    var symbol : String {
        switch self {
        case .EXPENSE :
            return "-"
        case .INCOME:
            return "+"
        case .TRANSFER:
            return ""
        }
    }
}
