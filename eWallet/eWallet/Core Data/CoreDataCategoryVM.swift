//
//  CoreDataViewModel.swift
//  eWallet
//
//  Created by Habibur Rahman on 17/5/24.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataCategoryVM : ObservableObject {
   
    let manager = CoreDataManager.instance
    @Published var categories : [CategoryEntity] = []

    
    init() {
        addCategoryList(categories: CategoryUtility().prepareCategories())
    }
    
    func getCategories() {
        let request = NSFetchRequest<CategoryEntity>(entityName: Constants.CORE_DATA.CategoryEntity)
        do{
            categories = try  manager.context.fetch(request)
            
            for category in categories {
                print(category.title)
            }
            
        }catch{
            print("Error Fetching.. \(error.localizedDescription)")
        }
       
    }
    
    func addCategory(category : Category){
        let newCat = CategoryEntity(context: manager.context)
        newCat.title = category.title
        newCat.icon = category.iconImage
        newCat.id = category.id
        newCat.colorCode = category.color.description
        
        save()
    }
    
    func addCategoryList(categories : [Category]){
        for category in categories {
            addCategory(category: category)
        }
    }
     
    func save(){
        categories.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() +  1.0 ){
            self.manager.save()
            self.getCategories()
        }
        
    }
}
