//
//  AccountsListView.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/2/24.
//

import SwiftUI

struct AccountsListView: View {
    private var data = Array(1 ... 3)
    private let fixedColumn = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
    ]

    var body: some View {
        VStack {
            topTitleView

            LazyVGrid(columns: fixedColumn, spacing: 10) {
                ForEach(data, id: \.self) { _ in
                    AccountGridItemView()
                }
            }
            
            HStack {
                accountDetailsBtn

                Spacer()

                recordsBtn
            }.padding(.top,20)
            
        }.padding(10)

       
        
        Spacer()
    }
}

extension AccountsListView {
    var topTitleView: some View {
        HStack {
            Text("List of accounts")
                .foregroundStyle(Color.theme.primaryText)
                .font(.title2)
                .fontWeight(.semibold)

            Spacer()
            Button {
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.all, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                    )
                    .foregroundColor(.blue)
                    .shadow(color: .gray, radius: 1)
            }
        }
    }

    var accountDetailsBtn: some View {
        Button {
        } label: {
            Text("ACCOUNT  DETAIL")
                .foregroundStyle(Color.theme.primaryText)
                .font(.footnote)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.theme.white)
                ).shadow(color: .gray, radius: 1)
        }
    }

    var recordsBtn: some View {
        Button {
        } label: {
            HStack {
                Image(systemName: "list.bullet")
                    .foregroundColor(/*@START_MENU_TOKEN@*/ .blue/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)

                Text("RECORDS")
                    .foregroundStyle(Color.theme.primaryText)

            }.font(.footnote)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.theme.white)
                ).shadow(color: .gray, radius: 1)
        }
    }
}

#Preview {
    AccountsListView()
}
