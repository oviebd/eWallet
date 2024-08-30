//
//  DefaultBgModifier.swift
//  eWallet
//
//  Created by Habibur Rahman on 30/8/24.
//

import SwiftUI

enum BgShapeType {
    case circle
    case roundedRectangle
}

struct DefaultBgModifier: ViewModifier {
    let bgColor: Color
    let cornerRadius: CGFloat
    let shapeType: BgShapeType

    func body(content: Content) -> some View {
        content
            .background {
                switch shapeType {
                case .circle:
                    Circle()
                        .fill(bgColor)
                case .roundedRectangle:
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .foregroundStyle(bgColor)
                }
            }
    }
}

extension View {
    func WithDefaultRectangularBgModifier(bgColor: Color, cornerRadius: CGFloat) -> some View {
        modifier(DefaultBgModifier(bgColor: bgColor, cornerRadius: cornerRadius, shapeType: .roundedRectangle))
    }

    func WithDefaultCircularBgModifier(bgColor: Color) -> some View {
        modifier(DefaultBgModifier(bgColor: bgColor, cornerRadius: 1, shapeType: .circle))
    }
}
