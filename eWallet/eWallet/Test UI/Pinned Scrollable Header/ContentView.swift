//
//  ContentView.swift
//  eWallet
//
//  Created by Habibur Rahman on 15/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //To ignore and get Safe area size
        
        GeometryReader { proxy in
            let topEdge = proxy.safeAreaInsets.top
            PinnedScrolledView(topEdge: topEdge)
                .ignoresSafeArea(.all,edges: .top)
        }
    }
}

#Preview {
    ContentView()
}
