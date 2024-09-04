//
//  View.swift
//  eWallet
//
//  Created by Habibur Rahman on 4/9/24.
//

import Foundation
import SwiftUI

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
