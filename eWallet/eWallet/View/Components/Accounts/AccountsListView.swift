//
//  AccountsListView.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/2/24.
//

import SwiftUI

struct AccountsListView: View {
    
    
    private var data  = Array(1...20)
       private let fixedColumn = [
           
        GridItem(.flexible(), spacing: 0),
           GridItem(.flexible(), spacing: 0)
       ]
    
    var body: some View {
        VStack {
            topTitleView
            
            ScrollView{
                       LazyVGrid(columns: fixedColumn, spacing: 20) {
                           ForEach(data, id: \.self) { item in
                               AccountGridItemView()
                                   .background(Color.red)
                           }
                       }
                   }
               }
            
        }
}

extension AccountsListView {
    
    var topTitleView : some View {
        HStack {
            Text("List of accounts")
                .foregroundStyle(Color.theme.primaryText)
                .font(.title2)
                .fontWeight(.semibold)

            Spacer()
            Button {
                
            } label: {
                Image(systemName: "gearshape.fill")
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
    
}

#Preview {
    AccountsListView()
}
