//
//  CustomPicker.swift
//  eWallet
//
//  Created by Habibur Rahman on 20/3/24.
//

import SwiftUI

struct CustomSegmentedPicker<Data, Content>: View where Data: Hashable, Content: View {
    // TODO: Add initializer and properties

    public let sources: [Data]
    public let selection: Data?
    private let itemBuilder: (Data) -> Content
    private var customIndicator: AnyView?

    // background
    @State private var backgroundColor: Color = Color.black.opacity(0.05)
    func pickerBackgroundColor(_ color: Color) -> CustomSegmentedPicker {
        var view = self
        view._backgroundColor = State(initialValue: color)
        return view
    }

    // borders and corner radius.

    @State private var cornerRadius: CGFloat?
    func cornerRadius(_ cornerRadius: CGFloat) -> CustomSegmentedPicker {
        var view = self
        view._cornerRadius = State(initialValue: cornerRadius)
        return view
    }

    // custom indicators
    @State private var borderColor: Color?
    func borderColor(_ borderColor: Color) -> CustomSegmentedPicker {
        var view = self
        view._borderColor = State(initialValue: borderColor)
        return view
    }

    @State private var borderWidth: CGFloat?
    func borderWidth(_ borderWidth: CGFloat) -> CustomSegmentedPicker {
        var view = self
        view._borderWidth = State(initialValue: borderWidth)
        return view
    }


    public init(
        _ sources: [Data],
        selection: Data?,
        indicatorBuilder: @escaping () -> some View,
        @ViewBuilder itemBuilder: @escaping (Data) -> Content
    ) {
        self.sources = sources
        self.selection = selection
        self.itemBuilder = itemBuilder
        customIndicator = AnyView(indicatorBuilder())
    }

    public var body: some View {
        ZStack(alignment: .center) {
            // indicator
            
            if let selection = selection, let selectedIdx = sources.firstIndex(of: selection) {
                if let customIndicator = customIndicator {
                    customIndicator
                }
                else {
                    GeometryReader { geo in
                        RoundedRectangle(cornerRadius: cornerRadius ?? 0)
                            .foregroundColor(.accentColor)
                            .padding(EdgeInsets(top: borderWidth ?? 2, leading: borderWidth ?? 2, bottom: borderWidth ?? 2, trailing: borderWidth ?? 2))
                            .frame(width: geo.size.width / CGFloat(sources.count))
                            .shadow(color: .black.opacity(0.1), radius: 2, x: 1, y: 1)
                           // .animation(.spring().speed(5), value: 1.0)
                            //.animation(.spring().speed(1.5))
                            .offset(x: geo.size.width / CGFloat(sources.count) * CGFloat(selectedIdx), y: 0)
                    }.frame(height: 32)
                }
            }
            
            
            // items
            HStack(spacing: 0) {
                ForEach(sources, id: \.self) { item in
                    itemBuilder(item)
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: cornerRadius ?? 0)
            .fill(backgroundColor)
            .stroke(borderColor ?? Color.clear, lineWidth: borderWidth ?? .zero)
        )
    }
}

// #Preview {
//    CustomPicker()
// }
