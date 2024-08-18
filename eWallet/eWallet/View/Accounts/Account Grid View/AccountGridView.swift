//
//  AccountsListView.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/2/24.
//

import SwiftUI

public enum AccountsListViewButtonTypeEnum {
    case AddAccount
}

struct AccountGridView: View {
    var onAddButtonPressed: () -> Void
    var onAccountItemPressed : (AccountData) -> Void

    @StateObject private var vm = AccountGridVM()

    private let fixedColumn = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]

    var body: some View {
        LazyVGrid(columns: fixedColumn, spacing: 10) {
            ForEach(vm.accountList) { item in
                AccountGridItemView(accountData: item)
                    .onTapGesture {
                        onAccountItemPressed(item)
                    }
            }
            
            AddAccountGridItemView()
                .onTapGesture {
                onAddButtonPressed()
            }
        }.padding(.horizontal,20)
            .padding(.top,10)
            .padding(.bottom,70)
        .background(Color.theme.accountGridCardBG)

        .ignoresSafeArea()

    }
    
//    func getHeight(){
//        let finalCount = vm.accountList.count + 1
//        let count = ( finalCount / 2 ) + (finalCount % 2)
//        
//        return count *
//        
//    }
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
    AccountGridView(onAddButtonPressed: { },
                    onAccountItemPressed: {_ in})
}
