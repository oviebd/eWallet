//
//  OffsetModifier.swift
//  eWallet
//
//  Created by Habibur Rahman on 15/8/24.
//

import Foundation
import SwiftUI

struct OffsetModifier: ViewModifier {
    
    @Binding var offset : CGFloat
    
    func body(content:Content) -> some View {
        
        content.overlay (
            GeometryReader{ proxy -> Color in
                
                //getting value for coordinate space called scroll
                let minY = proxy.frame(in: .named("SCROLL")).minY
                print(minY)
                DispatchQueue.main.async {
                    self.offset = minY
                }
        
                return Color.clear
                
            }, alignment: .top)
        }
        
}
    
