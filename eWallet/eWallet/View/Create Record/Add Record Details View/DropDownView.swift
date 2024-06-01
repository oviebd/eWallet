//
//  DropDownView.swift
//  eWallet
//
//  Created by Habibur Rahman on 27/3/24.
//

import SwiftUI

struct DropDownView: View {
    var anchor: Anchor = .bottom
    let title: String
    let prompt: String
    let options: [String]

    @State var isExpanded = false
    @Binding var selection: String?
    

    var body: some View {
        HStack() {
            Text(title)
                .font(.footnote)
                .foregroundStyle(.gray)
                .opacity(0.8)
                .padding(.horizontal)
            
            Spacer()

            VStack {
                HStack {
                    Text(selection ?? prompt)

                    Spacer()

                    Image(systemName: "chevron.down")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .rotationEffect(.degrees(isExpanded ? -180 : 0))
                }

                
                .frame(height: 40)
                .padding(.horizontal)
                .onTapGesture {
                    withAnimation(.snappy) { isExpanded.toggle() }
                }

                if isExpanded {
                    VStack {
                        ForEach(options, id: \.self) { option in
                            HStack {
                                Text(option)
                                    .foregroundStyle(selection == option ? Color.primary : .gray)

                                Spacer()

                                if selection == option {
                                    Image(systemName: "checkmark")
                                        .font(.subheadline)
                                }
                            }
                            .frame(height: 40)
                            .padding(.horizontal)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    selection = option
                                    isExpanded.toggle()
                                }
                            }
                        }
                    }
                    .transition(.move(edge: .bottom))
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
  enum Anchor {
        case top
        case bottom
    }
}

#Preview {
    
    DropDownView(title: "Payment Type", prompt: "Cash", options: ["Weekly", "Monthly", "Yearly"], selection: .constant("Weekly"))
}
