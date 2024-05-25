//
// CustomNavBarView.swift
//  eWallet
//
//  Created by Habibur Rahman on 28/3/24.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
   
    let title: String
    let showBackButton: Bool


    var body: some View {
        HStack(spacing: 0) {
            if showBackButton{
                backButton
            }
            titleSection
                .padding(.leading, 15)

            Spacer()

            rightButton
                .opacity(0)

        }.padding()
            .frame(maxWidth: .infinity)
            .font(.title3)
            .foregroundStyle(Color.white)
            .background(Color.blue.ignoresSafeArea())
    }
}

#Preview {
    CustomNavBarView(title: "Title", showBackButton: true)
}

extension CustomNavBarView {
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }

    private var titleSection: some View {
        Text(title)
            .font(.title3)
    }

    private var rightButton: some View {
        Button {
        } label: {
            Image(systemName: "seal")
        }
    }
}
