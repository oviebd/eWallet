//
//  CustomSearchView.swift
//  eWallet
//
//  Created by Habibur Rahman on 3/9/24.
//

import SwiftUI

struct CustomSearchView: View {
    
    let maxHeight: CGFloat = 40
    var topEdge: CGFloat = 0
    
    @Binding var searchText: String
    @Binding var offset: CGFloat
    var onSearchPressed: ((String) -> Void)
    
    var body: some View {
        HStack {
            Group {
                if getProgress() > 0.7 {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.theme.secondaryText)
                        .onTapGesture {
                            onSearchPressed(searchText)
                        }

                    TextField("Search", text: $searchText)
                        .padding(.horizontal, 5)
                        .foregroundStyle(Color.theme.primaryText)
                        .font(.system(size: 18))
                    
                    Spacer()
                    
                    if searchText.isEmptyString() == false {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.theme.secondaryText)
                            .onTapGesture {
                                searchText = ""
                            }
                    }
                    
                }
            }

        }.foregroundStyle(Color.theme.white.opacity(getProgress()))
            .frame(maxWidth: .infinity)

            // Sticky Effect ...
            .frame(height: getHeight())
            .padding(.horizontal, 20)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.theme.gray.opacity(0.3)))
            .padding(.horizontal, 20)
    }
    
    func getHeight() -> CGFloat {
        var topHeight = maxHeight + offset
        if topHeight < 0 {
            topHeight = 0
        }
        return topHeight > maxHeight ? maxHeight : topHeight
    }
    
    func getProgress() -> CGFloat {
        let progress = -offset / (maxHeight - topEdge)
        return 1 - progress
    }
}

#Preview {
    CustomSearchView(searchText: .constant(""), offset: .constant(0.0), onSearchPressed: { _ in
        
    })
}
