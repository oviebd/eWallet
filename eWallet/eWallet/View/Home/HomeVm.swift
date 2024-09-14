//
//  HomeVm.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/5/24.
//

import Combine
import Foundation

class HomeVm: ObservableObject {
    @Published var isCreateAccountButtonPressed: Bool = false
    @Published var isCreateRecordButtonPressed: Bool = false

    @Published var selectedRecordData: RecordData?
    @Published var onPressedShowMoreFromList: Bool = false

    @Published var onSingleAccountButtonPressed: Bool = false

   
}
