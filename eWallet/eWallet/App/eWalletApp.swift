//
//  eWalletApp.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/2/24.
//

import SwiftUI

@main
struct eWalletApp: App {
    @State var select: String?

    init() {
        UIScrollView.appearance().bounces = false
    }

    var body: some Scene {
        WindowGroup {
            // ContentView()
            HomeView()
            // PinnedScrolledView(topEdge: 0)
            // AddAccountView()
            // DropDownView(title: "title", prompt: "Select", options: ["Item 01", "Item 02", "item 03"], selection: $select)

//            CustomNavView {
//
//            }
        }
    }
}
