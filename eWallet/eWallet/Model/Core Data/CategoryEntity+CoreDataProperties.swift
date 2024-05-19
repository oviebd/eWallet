//
//  CategoryEntity+CoreDataProperties.swift
//  eWallet
//
//  Created by Habibur Rahman on 19/5/24.
//
//

import Foundation
import CoreData
import SwiftUI


extension CategoryEntity {

    func convertToCategory() -> Category {
        return Category(title: self.title ?? "", iconImage: self.icon ?? "" , color: Color.theme.mediumDarkBlue)
        }

}

