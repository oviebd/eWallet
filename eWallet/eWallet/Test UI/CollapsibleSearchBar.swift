//
//  CollapsableSearch.swift
//  eWallet
//
//  Created by Habibur Rahman on 3/9/24.
//

import SwiftUI

struct SmoothCollapsibleSearchBar: View {
    @State private var searchText: String = ""
    @State private var searchBarHeight: CGFloat = 120 // Start with the maximum height

    var body: some View {
        VStack(spacing: 0) {
            SearchBarView(searchText: $searchText)
                .frame(height: searchBarHeight)
                .background(Color(.systemGray6))
                .animation(.easeInOut(duration: 0.3), value: searchBarHeight)
            
            ScrollView {
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: ScrollViewOffsetKey.self, value: geometry.frame(in: .global).minY)
                }
                .frame(height: 0)
                
                // Example content
                VStack {
                    ForEach(0..<50) { index in
                        Text("Item \(index)")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 2)
                            .padding(.horizontal)
                            .padding(.top, 8)
                    }
                }
                .padding(.top, searchBarHeight) // Push content below the search bar
            }
            .background(Color(.systemGray6))
            .onPreferenceChange(ScrollViewOffsetKey.self) { value in
                updateSearchBarHeight(for: value)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }

    private func updateSearchBarHeight(for scrollOffset: CGFloat) {
        let maxHeight: CGFloat = 120 // Maximum height when expanded
        let minHeight: CGFloat = 56  // Minimum height when collapsed

        // Calculate the new height based on the scroll position
        let newHeight = max(minHeight, maxHeight - (scrollOffset / 2))

        // Smoothly update the height
        withAnimation(.easeInOut(duration: 0.3)) {
            searchBarHeight = newHeight
        }
    }
}

struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search", text: $searchText)
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(8)
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

struct ScrollViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

#Preview {
    SmoothCollapsibleSearchBar()
}


