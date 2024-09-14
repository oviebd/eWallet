//
//  PreviewProvider.swift
//  eWallet
//
//  Created by Habibur Rahman on 23/7/24.
//

import Foundation
import SwiftUI


extension Preview {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

//extension PreviewProvider {
//    
//    static var dev: DeveloperPreview {
//        return DeveloperPreview.instance
//    }
//    
//}


class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
   // let recordDetailsDatav = AdditionalRecordData(note: "sample Note ", date: Date.now, time: Date.now)
}
