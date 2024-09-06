//
//  CategoryListVm.swift
//  eWallet
//
//  Created by Habibur Rahman on 17/5/24.
//

import Combine
import Foundation


class CategoryListVm: ObservableObject {
    
    private var categoryRepo: CategoryDataRepository
    private var cancellables = Set<AnyCancellable>()
    @Published var categories: [CategoryData] = []
    @Published var recentCategories: [CategoryData] = []
    
   
    init() {
        categoryRepo = CategoryDataRepository.shared(categoryRepo: CDCategoryRepository())
        iniCategorySubscription()
    }

    func iniCategorySubscription() {
        let _ = categoryRepo.getCategories()
        categoryRepo.$categoryDataList.sink { [weak self] categoryList in
            
            DispatchQueue.main.async {
                self?.categories = categoryList
                self?.recentCategories = categoryList
                self?.checkAndCreateCategoryList()
            }
            
            
        }.store(in: &cancellables)
    }

    func checkAndCreateCategoryList() {
        if categories.count <= 0 {
            addCategoryList(categories: CategoryUtility.getAllCategories())
        }
    }

    func addCategory(category: CategoryData) {
    }

    func addCategoryList(categories: [CategoryData]) {
        categoryRepo.addCategoryList(categories: categories) { _ in
            
        }
    }

    deinit {
        cancellables.removeAll()
    }
}
