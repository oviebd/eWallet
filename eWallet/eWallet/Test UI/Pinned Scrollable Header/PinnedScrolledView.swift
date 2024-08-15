//
//  PinnedScrolledView.swift
//  eWallet
//
//  Created by Habibur Rahman on 10/8/24.
//

import SwiftUI

struct PinnedScrolledView: View {
    
    let maxHeight = UIScreen.main.bounds.height / 2.3
    var topEdge : CGFloat
    //Offset
    @State var offset : CGFloat = 0
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(spacing: 15){
                
                //Top Nav View
                
                GeometryReader{ proxy in
                    
                    TopBarView(topEdge: topEdge, offset: $offset)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity,maxHeight : .infinity, alignment : .bottom)
                        .background(Color.theme.darkBlue, in: CustomCorner(corners: [.bottomRight], radius: 50))
                       // .background(Color.theme.darkBlue)
                    
                }.frame(height: maxHeight)
                //Fixing at top
                    .offset(y: -offset)
            }
            .modifier(OffsetModifier(offset: $offset))
        }
        .coordinateSpace(.named("SCROLL"))
        
    }
}

#Preview {
  //  PinnedScrolledView(topEdge: <#CGFloat#>)
    ContentView()
}
