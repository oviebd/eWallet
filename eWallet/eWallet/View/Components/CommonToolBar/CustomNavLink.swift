//
//  CustomNavLink.swift
//  eWallet
//
//  Created by Habibur Rahman on 29/3/24.
//

import SwiftUI

struct CustomNavLink <Label : View, Destination : View>: View {
    
    let destination : Destination
    let label : Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink {
            CustomNavBarContainerView {
                destination
            }
            .navigationBarHidden(true )
        } label: {
            label
        }

    }
}

#Preview {
    CustomNavView {
        CustomNavLink(destination: Text("Destination")) {
            Text("Click Me")
        }
    }
   
}
