//
//  CustomAlertView.swift
//  eWallet
//
//  Created by Habibur Rahman on 1/6/24.
//

import Foundation
import SwiftUI

struct CustomAlertView: View {
    @Binding var presentAlert: Bool
    var alertData: CustomAlertDataModel
    var positiveButtonAction: (() -> Void)?
    var negativeButtonAction: (() -> Void)?

    var body: some View {
 
        VStack{
            
            Spacer()
            
            content
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                .background(RoundedRectangle(cornerRadius: 20.0, style: .continuous).fill(Color.white)
                    .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 2))
            
            Spacer()
            
        }
        .ignoresSafeArea()
        .padding(.horizontal, 20)
            //.frame(height: UIScreen.main.bounds.size.height)
        .background(Color.black.opacity(0.5))
        
        
           
    }
}

#Preview {
    CustomAlertView(presentAlert: .constant(true), alertData: AlertDataUtils.alertDmmyDataMultipleButton)
}

extension CustomAlertView {
    var positiveButton: some View {
        Button {
            presentAlert = false
            if let btnACtion = positiveButtonAction {
                btnACtion()
            }
        } label: {
            Text(alertData.positiveButtonTitle)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10.0, style: .continuous).fill(alertData.alertType.getPositiveButtonColor()))
        }
    }

    var negativeButton: some View {
        Button {
            presentAlert = false
            if let btnACtion = negativeButtonAction {
                btnACtion()
            }
        } label: {
            Text(alertData.negativeButtonTitle)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10.0, style: .continuous).fill(alertData.alertType.getNegativeButtonColor()))
        }
    }
    var content : some View {
        VStack(spacing: 15) {
            
            Image(systemName: alertData.alertType.getImage())
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundStyle(alertData.alertType.getImageForgroundColor())
                .padding()

            Text(alertData.title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(alertData.alertType.getImageForgroundColor())

            Text(alertData.message)
                .font(.headline)
                .foregroundStyle(Color.theme.secondaryText)
                .multilineTextAlignment(.center)

            HStack{
                if alertData.isPositiveButtonActive {
                    positiveButton
                }
                if alertData.isNegativeButtonActive {
                    negativeButton
                }
            }
           
        }
    }
    
}
