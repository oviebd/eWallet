//
//  CommonDropdownView.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/5/24.
//

import Foundation
import SwiftUI

struct CommonDropdownView: View {

    var dropdownOptions: [String] = []

    @State private var isDropdownVisible = false
    @Binding var selectedOptionIndex : Int

    var body: some View {
        HStack {
           
            Spacer()
            
            Text(dropdownOptions[selectedOptionIndex])
                .lineLimit(1)
                .padding(.vertical, 0)
            Menu {
                Picker("", selection: $selectedOptionIndex) {
                    ForEach(0 ..< dropdownOptions.count, id: \.self) { index in
                        Text(dropdownOptions[index]).tag(index)
                    }
                }
            } label: {
                
                Image(systemName: "chevron.down")
                    .frame(width: 30, height: 30)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.white)
    }
}

#Preview {
    
    CommonDropdownView(dropdownOptions: ["a", "b"], selectedOptionIndex: .constant(0))
}
