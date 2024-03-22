//
//  SegmentedPickerIndicatorView.swift
//  eWallet
//
//  Created by Habibur Rahman on 20/3/24.
//

import SwiftUI

struct SegmentedPickerIndicatorView : View {
    
    var width : CGFloat
    @Binding var selectedItemIndex : Int
    
    @State private var backgroundColor: Color = Color.yellow
    func backgroundColor(_ color: Color) -> SegmentedPickerIndicatorView {
        var view = self
        view._backgroundColor = State(initialValue: color)
        return view
    }
    
    var body: some View {
        Rectangle()
            .foregroundColor(backgroundColor)
            //.cornerRadius(6.0)
            .padding(1)
            .frame(width: width)
            .shadow(color: .black.opacity(0.1), radius: 2, x: 1, y: 1)
          //  .animation(.spring().speed(1.5), value: 1)
            .offset(x: width * CGFloat(selectedItemIndex), y: 0)
    }
}

#Preview {
    SegmentedPickerIndicatorView(width: 100, selectedItemIndex: .constant(0))
}
