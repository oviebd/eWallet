//
//  TestAnimationView.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/3/24.
//

import SwiftUI

struct TestAnimationView: View {
   
    @State var shouldShow: Bool = false

    @State var s : Bool = false
    var body: some View {
        ZStack(alignment: .top) {
            
            
            VStack{
                Button {
                    shouldShow.toggle()
                } label: {
                    Text("Show/Hide")
                }
                
                Spacer()
            }.background(Color.red)

//            if s {
//               // Rectangle()
//              //  ChooseAccountView()
//                   // .frame(width: 100, height: 100)
//                    .offset( y: 100)
//                    .transition(.move(edge: .bottom))
//            }
        }.onChange(of: shouldShow, initial: false) {
            
            withAnimation(.easeInOut(duration: 5)) {
                s = shouldShow
            }
        }

     
    }
}

#Preview {
    TestAnimationView()
}
