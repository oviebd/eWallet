//
//  AppNavBarView.swift
//  eWallet
//
//  Created by Habibur Rahman on 29/3/24.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()

                CustomNavLink(destination: Text("Destination")
                    .customNavigationTitle("Second Screen")
                    .customNavigationBarBackButtonHidden(false)) {
                        Text("Navigate")
                    }
            }
            .customNavBarItems(title: "New Title", backButtonHidden: true)
        }
    }
}

#Preview {
    AppNavBarView()
}
