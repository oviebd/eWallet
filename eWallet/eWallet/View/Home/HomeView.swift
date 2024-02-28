//
//  HomeView.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/2/24.
//

import SwiftUI

struct HomeView: View {
    @State var showMe = false
    
    var body: some View {
    
        ZStack(alignment: .top) {
        
            VStack{
                
                Button{
                    showMe.toggle()
                }label: {
                  Text("Click me")
                }
                
                AccountsListView()
                Spacer()
            }
          
            
            
            if showMe {
                ZStack{
                    AddAccountFormView()
                        .frame(height: 200)
                        .transition(AnyTransition.scale.animation(.easeInOut))
                       // .transition(.move(edge: .bottom))
                       // .animation(.easeInOut)
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .transition(AnyTransition.scale.animation(.easeInOut))
                .background(Color.black.opacity(0.8))
                
               
            }
            
            
        }.background(Color.white)
       
       
       // Spacer()
       
    }
}

#Preview {
    HomeView()
}
