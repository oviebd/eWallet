//
//  CategoryDataRepository.swift
//  eWallet
//
//  Created by Habibur Rahman on 21/7/24.
//

import Foundation
import SwiftUI

struct CategoryData: Hashable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var iconImage: String
    let color: Color
}

protocol CategoryDataRepoProtocol {
    func getCategories() -> [CategoryData]
    func addCategory(categoryData: CategoryData) -> Bool
    func addCategoryList(categories: [CategoryData], completation: @escaping (Bool) -> Void)
    func getCategoryEntityFromID(id: String) -> CategoryEntity?
}

class CategoryDataRepository {
    private static var sharedInstance: CategoryDataRepository!

    var categoryRepo: CategoryDataRepoProtocol
    @Published var categoryDataList = [CategoryData]()

    private init(categoryRepo: CategoryDataRepoProtocol) {
        self.categoryRepo = categoryRepo
    }

    static func shared(categoryRepo: CategoryDataRepoProtocol) -> CategoryDataRepository {
        if sharedInstance == nil {
            sharedInstance = CategoryDataRepository(categoryRepo: categoryRepo)
        } else {
            sharedInstance.categoryRepo = categoryRepo
        }

        return sharedInstance
    }

    func getCategories() -> [CategoryData] {
        categoryDataList = categoryRepo.getCategories()
        return categoryDataList
    }

    func addCategory(categoryData: CategoryData) -> Bool {
        let isSuccess = categoryRepo.addCategory(categoryData: categoryData)
        if isSuccess {
            let _ = getCategories()
        }
        return isSuccess
    }

    func addCategoryList(categories: [CategoryData], completation: @escaping (Bool) -> Void) {
        categoryRepo.addCategoryList(categories: categories) { isSuccess in
            if isSuccess {
                let _ = self.getCategories()
               
            }
            completation(isSuccess)
        }
    }

    func getCategoryEntityFromId(id: String) -> CategoryEntity? {
        return categoryRepo.getCategoryEntityFromID(id: id)
    }
}
