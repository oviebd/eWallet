
import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    
    struct ColorTheme {
        
        let accent = Color("AccentColor")
        let background = Color("BackgroundColor")
        let primaryText = Color("PrimartTextColor")
        let secondaryText = Color("SecondaryTextColor")
        let primaryDivider = Color("primaryDivider")
        
        let primaryBG = Color("PrimaryBG")
        let searchBG = Color("searchBG")
        let darkRed = Color("DarkRed")
        
     
        let white = Color("White")
        let green = Color("GreenColor")
        let red = Color("RedColor")
        let gray = Color("Gray")
        let teal = Color("Teal")
        let paste = Color("Paste")
        
        let normalBlue = Color("Blue")
        let darkBlue = Color("DarkBlue")
        let mediumDarkBlue = Color("MediumDarkBlue")
        let shadowColor = Color("ShadowColor")
        let lightBlue = Color("LightBlue")
        
        let accountGridCardBG = Color("AccountGridCardBG")
        
    }
}


extension Color {
   
    func toHex() -> String? {
        let uic = UIColor(self)
        guard let components = uic.cgColor.components, components.count >= 3 else {
            return nil
        }
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)

        if components.count >= 4 {
            a = Float(components[3])
        }

        if a != Float(1.0) {
            return String(format: "#%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "#%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
    
    init(hex: String) {
            var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
            print(cleanHexCode)
            var rgb: UInt64 = 0
            
            Scanner(string: cleanHexCode).scanHexInt64(&rgb)
            
            let redValue = Double((rgb >> 16) & 0xFF) / 255.0
            let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
            let blueValue = Double(rgb & 0xFF) / 255.0
            self.init(red: redValue, green: greenValue, blue: blueValue)
        }

}
