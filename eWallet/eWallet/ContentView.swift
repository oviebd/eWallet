//
//  ContentView.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
                Text("Hello, world!")
                   .font(.largeTitle)
                   .foregroundColor(.white)
             }
             .frame(maxWidth: .infinity)
             .background(Color.blue)
//             .edgesIgnoringSafeArea(.all)
             .navigationTitle("VStack Example")
             .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
