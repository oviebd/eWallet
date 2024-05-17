//
//  CategoryData.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/3/24.
//

import Foundation
import SwiftUI

struct Category : Hashable , Identifiable{
    var id: String  = UUID().uuidString
    var title: String
    var iconImage: String
    let color: Color
}

class CategoryUtility {
  
    var allCatagories: [Category] = [Category]()
    var recentCatagories: [Category] = [Category]()

    init() {
        allCatagories = prepareCategories()
        recentCatagories = prepareCategories()
    }

    func prepareCategories() -> [Category] {
           
        var categories: [Category] = [Category]()
       
        let catagory1 = Category(title: "Health", iconImage: "stethoscope.circle", color: .red)
        let catagory2 = Category(title: "Shopping", iconImage: "folder.fill", color: Color.theme.lightBlue)
        let catagory3 = Category(title: "Housing", iconImage: "house.fill", color: .orange.opacity(0.7))
        let catagory4 = Category(title: "Vehicle", iconImage: "car", color: .purple)
        let catagory5 = Category(title: "Communication, PC", iconImage: "desktopcomputer", color: .green.opacity(0.8))
        
        categories.append(catagory1)
        categories.append(catagory2)
        categories.append(catagory3)
        categories.append(catagory4)
        categories.append(catagory5)
        
        categories.append(catagory1)
        categories.append(catagory2)
        categories.append(catagory3)
        categories.append(catagory4)
        categories.append(catagory5)
        
        categories.append(catagory1)
        categories.append(catagory2)
        categories.append(catagory3)
        categories.append(catagory4)
        categories.append(catagory5)
        
//        recentCatagories.append(catagory1)
//        recentCatagories.append(catagory2)
//        recentCatagories.append(catagory3)
//        recentCatagories.append(catagory4)
//        recentCatagories.append(catagory5)
        
        return categories
    }
}
