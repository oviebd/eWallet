//
//  ContentView.swift
//  CalculatorAppForTest
//
//  Created by Habibur Rahman on 22/3/24.
//

import SwiftUI

enum CalculatorButtonEnum: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case decimal = "."
    case percent = "%"

//    var backgroundColor: Color {
//        switch self {
//        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .percent, .decimal:
//            return Color(.lightGray)
    ////        case .clear, .negative, .percent:
    ////            return Color(.lightGray)
//        default:
//            return .orange
//        }
//    }
}

enum anotherCalulatorButtonEnum: String {
    case divide = "/"
    case multiply = "x"
    case subtract = "-"
    case add = "+"
    case equal = "="
}

struct ContentView2: View {
    let buttons: [[CalculatorButtonEnum]] = [
//            [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine],
        [.four, .five, .six],
        [.one, .two, .three],
        [.decimal, .zero, .percent],
    ]

    let anotherButtton: [anotherCalulatorButtonEnum] = [
        .divide, .multiply, .subtract, .add, .equal,
    ]

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("0")
                    .font(.system(size: 100))
                    .foregroundColor(.yellow)

            }.padding()

            
            HStack{
                ForEach(buttons, id: \.self) { row in
                    VStack {
                        ForEach(row, id: \.self) { _ in
                            Rectangle()
                                .foregroundColor(Color.red)
                                .frame(width: 50, height: 50)
                            // SingleButton(buttonEnum: button)
                        }
     
                    }
                }
                
                VStack{
                    ForEach(anotherButtton, id: \.self) { _ in
                        Rectangle()
                            .foregroundColor(Color.yellow)
                            .frame(width: 50, height: 50)
                    }
                }
            }
            
           
            
            
            
        }
    }
}

#Preview {
    ContentView2()
}
