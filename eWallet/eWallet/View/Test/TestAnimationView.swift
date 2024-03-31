//
//  TestAnimationView.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/3/24.
//

import SwiftUI

struct TestAnimationView: View {
    @State var shouldShow: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            
            
            Button {
                withAnimation(.easeInOut(duration: 5)) {
                    shouldShow.toggle()
                }
            } label: {
                Text("Show/Hide")
            }
            
            
          
            if shouldShow {
               // Rectangle()
                ChooseAccountView(isViewShowing: $shouldShow)
                    .frame(width: 100, height: 100)
                    .offset(x: 100, y: 100)
                    .transition(.move(edge: .bottom))
            }
        }

     
    }
}

#Preview {
    TestAnimationView()
}
