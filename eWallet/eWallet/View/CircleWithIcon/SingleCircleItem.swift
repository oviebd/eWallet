//
//  SingleCircleItem.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
//

import SwiftUI

struct SingleCircleItem: View {
    var body: some View {
        ScrollView {
            HStack {
                Circle()
                    .frame(width: 80)
            }
        }
    }
}

#Preview {
    SingleCircleItem()
}
