//
//  CDCategoryRepository.swift
//  eWallet
//
//  Created by Habibur Rahman on 19/5/24.
//

import Foundation

import CoreData
import Foundation
import SwiftUI

extension CategoryEntity {
    func convertToCategory() -> CategoryData {
        let color = Color(hex: colorCode ?? "")
        return CategoryData(title: title ?? "", iconImage: icon ?? "", color: color)
    }
}

struct CDCategoryRepository: CategoryDataRepoProtocol {
    let manager = CoreDataManager.instance

    private func getCategoryEntityList() -> [CategoryEntity] {
        var categoryList = [CategoryEntity]()

        let request = NSFetchRequest<CategoryEntity>(entityName: Constants.CORE_DATA.CategoryEntity)
        do {
            let categories = try manager.context.fetch(request)

            return categories

        } catch {
            print("Error Fetching.. \(error.localizedDescription)")
        }

        return [CategoryEntity]()
    }

    func getCategories() -> [CategoryData] {
        var categoryList = [CategoryData]()
        for category in getCategoryEntityList() {
            let data = category.convertToCategory()
            // print(c.title)
            categoryList.append(data)
        }
        return categoryList
    }

    func getCategoryEntityFromID(id: String) -> CategoryEntity? {
        for category in getCategoryEntityList() {
            if category.id == id {
                return category
            }
        }
        return nil
    }

    func addCategory(categoryData: CategoryData) -> Bool {
        let newCat = CategoryEntity(context: manager.context)
        newCat.title = categoryData.title
        newCat.icon = categoryData.iconImage
        newCat.id = categoryData.id
        newCat.colorCode = categoryData.color.toHex()

        return save()
    }

    func addCategoryList(categories: [CategoryData], completation: @escaping (Bool) -> Void) {
        addCategoryListByBatch(categories: categories) { isSuccess in
            completation(isSuccess)
        }
    }

    private func addCategoryListByBatch(categories: [CategoryData], completation: @escaping (Bool) -> Void) {
        manager.container.performBackgroundTask { context in

            let request = self.createBatchRequest(categories: categories)
            do {
                try context.execute(request)
                completation(true)
            } catch {
                completation(false)
                debugPrint("Batch Insert Error - \(error.localizedDescription)")
            }
        }
    }

    private func createBatchRequest(categories: [CategoryData]) -> NSBatchInsertRequest {
        let totalCount = categories.count
        var index = 0

        let batchInsert = NSBatchInsertRequest(entity: CategoryEntity.entity()) {
            (managedObject: NSManagedObject) -> Bool in

            guard index < totalCount else { return true }

            if let catEntity = managedObject as? CategoryEntity {
                let category = categories[index]
                catEntity.title = category.title
                catEntity.icon = category.iconImage
                catEntity.id = category.id
                catEntity.colorCode = category.color.toHex()
            }

            index += 1
            return false
        }

        return batchInsert
    }

    func save() -> Bool {
        return manager.save()
    }
}
