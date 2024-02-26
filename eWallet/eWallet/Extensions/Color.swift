//
//  Color.swift
//  CryptoApp
//
//  Created by Habibur Rahman on 6/1/24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    
    struct ColorTheme {
        
        let accent = Color("AccentColor")
        let background = Color("BackgroundColor")
        let primaryText = Color("PrimartTextColor")
        let secondaryText = Color("SecondaryTextColor")
     
        let white = Color("White")
        let green = Color("GreenColor")
        let red = Color("RedColor")
        let blue = Color("Blue")
        let gray = Color("Gray")
        
    }
}
