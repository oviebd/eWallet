//
//  CategoryData.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/3/24.
//

import Foundation
import SwiftUI

struct Category : Hashable , Identifiable{
    var id: String // = UUID().uuidString
    var title: String
    var iconImage: String
    let color: Color
}

class CategoryUtility {
  
    var allCatagories: [Category] = [Category]()
    var recentCatagories: [Category] = [Category]()

    init() {
        prepareCategories()
    }

    func prepareCategories() {
           
        let catagory1 = Category(id: "1", title: "Health", iconImage: "stethoscope.circle", color: .red)
        let catagory2 = Category(id: "2", title: "Shopping", iconImage: "folder.fill", color: .blue)
        let catagory3 = Category(id: "3", title: "Housing", iconImage: "house.fill", color: .orange)
        let catagory4 = Category(id: "4", title: "Vehicle", iconImage: "car", color: .purple)
        let catagory5 = Category(id: "5", title: "Communication, PC", iconImage: "desktopcomputer", color: .green)
        
        allCatagories.append(catagory1)
        allCatagories.append(catagory2)
        allCatagories.append(catagory3)
        allCatagories.append(catagory4)
        allCatagories.append(catagory5)
        
        recentCatagories.append(catagory1)
        recentCatagories.append(catagory2)
        recentCatagories.append(catagory3)
        recentCatagories.append(catagory4)
        recentCatagories.append(catagory5)
        
    }
}
