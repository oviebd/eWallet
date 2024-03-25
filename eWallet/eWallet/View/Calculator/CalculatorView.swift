//
//  CalculatorView.swift
//  eWallet
//
//  Created by Habibur Rahman on 25/3/24.
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
    case clear = "AC"
    case divide = "/"
    case multiply = "x"
    case subtract = "-"
    case add = "+"
    case equal = "="

    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .clear, .decimal:
            return Color(Color.white.opacity(0.10))
        default:
            return Color.gray.opacity(0.1)
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct CalculatorView: View {
    @State var value = "0"
    @State var currentOperation: Operation = .none
    @State var previousValue: Double = 0.0
    @State var isOperationBtnPressed = false

    let buttons: [[CalculatorButtonEnum]] = [
        [.seven, .four, .one, .decimal],
        [.eight, .five, .two, .zero],
        [.nine, .six, .three, .clear],
    ]

    let anotherButtton: [CalculatorButtonEnum] = [
        .divide, .multiply, .subtract, .add, .equal,
    ]

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(value)
                    .font(.system(size: 100))
                    .foregroundColor(.yellow)

            }.padding()
            
            GeometryReader { geo in

                let width = geo.size.width / 4
                let height = geo.size.height / 4

                HStack(spacing: 0) {
                    ForEach(buttons, id: \.self) { row in
                        VStack(spacing: 0) {
                            ForEach(row, id: \.self) { button in
                                SingleButton(height: height, width: width, buttonEnum: button, onButtonClicked: { buttonType in
                                    print("Clicked\(buttonType.rawValue)")
                                    self.didTap(button: buttonType)
                                })
                            }
                        }
                    }

                    VStack(spacing: 0) {
                        ForEach(anotherButtton, id: \.self) { button in
                            let newHeight = geo.size.height / 5
                            SingleButton(height: newHeight, width: width, buttonEnum: button, onButtonClicked: { buttonType in
                                print("Clicked\(buttonType.rawValue)")
                                self.didTap(button: buttonType)
                            })
                        }
                    }
                }
            }
            .frame(height: 300)
        }
    }
    
    func didTap(button: CalculatorButtonEnum) {
        switch button {
        case .add:
           
            onOperationBtnCliked(operationType: .add)
            break
            
        case .subtract:
           
            onOperationBtnCliked(operationType: .subtract)
            break
            
        case .multiply:
          
            onOperationBtnCliked(operationType: .multiply)
            break
        case .divide:
          
            onOperationBtnCliked(operationType: .divide)
            break
            
                       
        case .equal:
            
             if button == .equal {
                
                let result = performOperation(value1: previousValue, value2: Double(self.value) ?? 0, operation: currentOperation)
                
                value = "\(result)"
            }
            
        case .clear:
            value = "0"
            previousValue = 0
        // value.removeLast()
        default:
            let number = button.rawValue

            if isOperationBtnPressed {
                value = "0"
                isOperationBtnPressed = false
            }

            if value == "0" {
                value = number
            } else {
                value = "\(value)\(number)"
            }
        }
    }
    
    func performOperation(value1: Double , value2: Double, operation: Operation) -> Double {
        
        var result = 0.0
        switch operation {
        case .add:
           result = value1 + value2
            break
        case .subtract:
            result = value1 - value2
            break
        case .multiply:
            result = value1 * value2
            break
        case .divide:
            result = value1 / value2
            break
            
        default:
        break
        }
        
        return result
    }
    
    func onOperationBtnCliked(operationType: Operation) {
        currentOperation = operationType
        previousValue = Double(value) ?? 0
        isOperationBtnPressed = true
        
    }

}

#Preview {
    CalculatorView()
}
