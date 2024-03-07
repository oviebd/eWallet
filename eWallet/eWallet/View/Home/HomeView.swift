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
            VStack {
                Button {
                    showMe.toggle()
                } label: {
                    Text("Click me")
                }

                AccountsListView()
                Spacer()
            }.popover(isPresented: $showMe) {
                AddAccountFormView()
            }

        }.background(Color.white)

        // Spacer()
    }
}

#Preview {
    HomeView()
}
