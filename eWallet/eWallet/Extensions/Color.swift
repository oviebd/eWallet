
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
        let gray = Color("Gray")
        
        let normalBlue = Color("Blue")
        let darkBlue = Color("DarkBlue")
        let mediumDarkBlue = Color("MediumDarkBlue")
        let shadowColor = Color("ShadowColor")
        let lightBlue = Color("LightBlue")
        
    }
}
