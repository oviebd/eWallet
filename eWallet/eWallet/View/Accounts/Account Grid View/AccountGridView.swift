//
//  AccountsListView.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/2/24.
//

import SwiftUI

public enum AccountsListViewButtonTypeEnum {
    case AddAccount
    case AccounDetails
    case Records
}

struct AccountGridView: View {
    var onButtonPressed: (AccountsListViewButtonTypeEnum) -> Void

    @StateObject private var vm = AccountGridVM()

    private let fixedColumn = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
    ]

    var body: some View {
        VStack {
           // topTitleView
            ScrollView {
                LazyVGrid(columns: fixedColumn, spacing: 5) {
                    ForEach(vm.accountList) { item in
                        AccountGridItemView(accountData: item)
                    }
                    
                    AddAccountGridItemView()
                }

            }


        }.padding(10)
        .background(Color.theme.accountGridCardBG)
        .ignoresSafeArea()

    }
}

extension AccountGridView {
//    var topTitleView: some View {
//        HStack {
//            Text("List of accounts")
//                .foregroundStyle(Color.theme.secondaryText)
//                .font(.title2)
//                .fontWeight(.semibold)
//
//            Spacer()
//
//            Button {
//                onButtonPressed(.AddAccount)
//            } label: {
//                Image(systemName: "plus")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .padding(.all, 10)
//                    .background(
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(Color.white)
//                    )
//                    .foregroundColor(.blue)
//                    .shadow(color: .gray, radius: 1)
//            }
//        }
//    }

//    var accountDetailsBtn: some View {
//        Button {
//            onButtonPressed(.AccounDetails)
//        } label: {
//            Text("ACCOUNT  DETAIL")
//                .foregroundStyle(Color.theme.secondaryText)
//                .font(.footnote)
//                .padding(.vertical, 10)
//                .padding(.horizontal, 20)
//                .background(
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color.theme.white)
//                ).shadow(color: .gray, radius: 1)
//        }
//    }

//    var recordsBtn: some View {
//        Button {
//            onButtonPressed(.Records)
//        } label: {
//            HStack {
//                Image(systemName: "list.bullet")
//                    .foregroundColor(/*@START_MENU_TOKEN@*/ .blue/*@END_MENU_TOKEN@*/)
//                    .fontWeight(.bold)
//
//                Text("RECORDS")
//                    .foregroundStyle(Color.theme.secondaryText)
//
//            }.font(.footnote)
//                .padding(.vertical, 10)
//                .padding(.horizontal, 20)
//                .background(
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color.theme.white)
//                ).shadow(color: .gray, radius: 1)
//        }
//    }
}

#Preview {
    AccountGridView(onButtonPressed: {
        _ in
    })
}
