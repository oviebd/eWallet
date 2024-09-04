//
//  CollapsableSearchView.swift
//  eWallet
//
//  Created by Habibur Rahman on 3/9/24.
//

import SwiftUI

struct CollapsableSearchView: View {
    let maxHeight: CGFloat = 50 // UIScreen.main.bounds.height / 2.3
    var topEdge: CGFloat
    var messages: [Message] = [Message(message: "One"), Message(message: "Two"), Message(message: "One"), Message(message: "Two"), Message(message: "One"), Message(message: "Two"), Message(message: "One"), Message(message: "Two")]

    // Offset
    @State var offset: CGFloat = 0
    @State var searchText: String = ""

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                GeometryReader { _ in
                    CustomSearchView(searchText: $searchText, offset: $offset, onSearchPressed: {
                        _ in 
                    })

                }.frame(height: maxHeight)
                   .offset(y: -offset)
                    .zIndex(1)

                // Sample Messages ...
                VStack(spacing: 15) {
                    ForEach(messages) { message in
                        MessageCardView(message: message)
                    }
                }
                .padding()
                .zIndex(0)
            }
            .modifier(OffsetModifier(offset: $offset))
        }
        .coordinateSpace(.named("SCROLL"))
    }
}

#Preview {
    CollapsableSearchView(topEdge: 0)
}
