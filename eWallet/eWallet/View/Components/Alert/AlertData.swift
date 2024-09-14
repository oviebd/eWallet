//
//  AlertData.swift
//  eWallet
//
//  Created by Habibur Rahman on 1/6/24.
//

import Foundation
import SwiftUI

enum AlertType {
    case success
    case failure
    case warning
    case delete

    func getImage() -> String {
        switch self {
        case .failure:
            return "xmark.octagon.fill"
        case .success:
            return "checkmark.diamond.fill"
        case .warning:
            return "checkmark.diamond.fill"
        case .delete:
            return "trash.fill"
        }
    }
    
    func getPositiveButtonColor() -> Color {
        switch self {
        case .failure, .delete,.warning:
            return Color.red
        case .success:
            return Color.green
        }
    }
    
    func getNegativeButtonColor() -> Color {
        return Color.gray
    }
    
    func getImageForgroundColor() -> Color {
        switch self {
        case .failure, .delete:
            return Color.red
        case .success:
            return Color.green
        case .warning:
            return Color.gray
        }
    }
}

struct CustomAlertDataModel {
    var imageName: String
    var title: String
    var message: String
    var alertType: AlertType
    
    var positiveButtonTitle = ""
    var negativeButtonTitle = ""


    var isNegativeButtonActive: Bool {
        return !negativeButtonTitle.isEmpty
    }

    var isPositiveButtonActive: Bool {
        return !positiveButtonTitle.isEmpty
    }
    
}

struct AlertDataUtils {
   
    public static let alertDmmyDataSingleButton = CustomAlertDataModel(imageName: "xmark.octagon.fill", title: "Failed", message: "Message", alertType: AlertType.success, positiveButtonTitle: "Ok")
   
    public static let alertDmmyDataMultipleButton = CustomAlertDataModel(imageName: "xmark.octagon.fill", title: "title", message: "Message", alertType: AlertType.success, positiveButtonTitle: "Ok", negativeButtonTitle: "Cancel")
    
   
    public static func getAlertDatafrom( alertData :  inout CustomAlertDataModel,
                                          message : String, alertType : AlertType,
                                         positiveButtonTitle : String = "" ,
                                         negativeButtonTitle : String = ""
                                
    ) {
        
        alertData.message = message
        alertData.alertType = alertType
        
        alertData.positiveButtonTitle = positiveButtonTitle
        alertData.negativeButtonTitle = negativeButtonTitle
      
    }
}
