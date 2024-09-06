//
//  CategoryData.swift
//  eWallet
//
//  Created by Habibur Rahman on 26/3/24.
//

import Foundation
import SwiftUI


class CategoryUtility {
  
    //static var allCatagories: [CategoryData] = [CategoryData]()
    //static var recentCatagories: [CategoryData] = [CategoryData]()

    static let catagory1 = CategoryData(title: "Health", iconImage: "stethoscope.circle", color: .red)
    static let catagory2 = CategoryData(title: "Shopping", iconImage: "folder.fill", color: Color.theme.lightBlue)
    static let catagory3 = CategoryData(title: "Housing", iconImage: "house.fill", color: .orange.opacity(0.7))
    static let catagory4 = CategoryData(title: "Vehicle", iconImage: "car", color: .purple)
    static let catagory5 = CategoryData(title: "Communication, PC", iconImage: "desktopcomputer", color: .green.opacity(0.8))
    
//    init() {
//        allCatagories = prepareCategories()
//        recentCatagories = prepareCategories()
//    }

    static func getAllCategories() -> [CategoryData] {
           
        var categories: [CategoryData] = [CategoryData]()
       
     
        
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
    
    static func getRecentCategories() -> [CategoryData] {
           
        var categories: [CategoryData] = [CategoryData]()
       
     
        
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
