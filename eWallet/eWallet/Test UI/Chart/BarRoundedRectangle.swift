//
//  BarRoundedRectangle.swift
//  eWallet
//
//  Created by Habibur Rahman on 7/9/24.
//

import Foundation
import SwiftUI

struct BarRoundedRectangle : Shape {
    
    var radius : CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addRoundedRect(in: CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: rect.height), cornerSize:CGSize(width: radius, height: radius), style: .continuous)
        
        return path
    }
    
}
