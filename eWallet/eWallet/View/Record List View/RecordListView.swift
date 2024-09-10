//
//  RecordListItem.swift
//  eWallet
//
//  Created by Habibur Rahman on 13/5/24.
//

import SwiftUI

struct RecordListView: View {
    @StateObject var vm = RecordListVM()

    var onShowMorePressed: () -> Void
    var onItemPresesd: (RecordData) -> Void

    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text("Last Records")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 10)

                Spacer()
            }

            VStack {
                ForEach(vm.recordsList) { item in
                    SingleRecordItem(recordData: item)
                        .onTapGesture {
                            onItemPresesd(item)
                        }
                }
            }.padding(.horizontal, 20)
                .padding(.bottom, 2)

            Button {
                onShowMorePressed()
            } label: {
                Text("Show More")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.theme.normalBlue)
                    .padding(20)
            }
        }
        .frame(maxWidth: .infinity)

        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.theme.primaryBG)
                .shadow(color: .gray, radius: 1)
        )
    }
}

#Preview {
    RecordListView(onShowMorePressed: {}, onItemPresesd: { _ in })
}
