//
//  CategoryListVm.swift
//  eWallet
//
//  Created by Habibur Rahman on 17/5/24.
//

import Foundation

class CategoryListVm : ObservableObject {
   

    private var categoryRepo : CDCategoryRepository = CDCategoryRepository()
    
    @Published var categories : [Category] = []

    
    init() {
      
        getCategories()
        
        if categories.count <= 0 {
            addCategoryList(categories: CategoryUtility().prepareCategories())
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.getCategories()
            }
        }
    }
    
    func getCategories() {
        categories = categoryRepo.getCategories()
        print("U>> Cat count \(categories.count)")
    }
    
    func addCategory(category : Category){
     
    }
    
    func addCategoryList(categories : [Category]){
        categoryRepo.addCategoryList(categories: categories)
    }
     
   
}
