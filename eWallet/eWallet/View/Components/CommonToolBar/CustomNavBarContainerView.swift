//
//  CustomNavBarContainerView.swift
//  eWallet
//
//  Created by Habibur Rahman on 29/3/24.
//

import SwiftUI

struct CustomNavBarContainerView<Content : View> : View {
    
    let content : Content
 
    @State var title: String = ""
    @State var showBackButton: Bool = true
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing : 0){
            CustomNavBarView(title: title, showBackButton: showBackButton)
            content
                .frame(maxWidth: .infinity,maxHeight: .infinity)
        }.onPreferenceChange(CustomNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self, perform: { value in
            self.showBackButton = !value
        })
    }
}

#Preview {
    CustomNavBarContainerView{
        ZStack{
            Color.green.ignoresSafeArea()
            
            Text("Hello World")
                .foregroundStyle(Color.white)
                .customNavigationTitle("New Title")
                .customNavigationBarBackButtonHidden(false)
        }
    }
}
