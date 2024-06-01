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
    func convertToCategory() -> Category {
        let color = Color(hex: colorCode ?? "")
        return Category(title: title ?? "", iconImage: icon ?? "", color: color)
    }
}

struct CDCategoryRepository {
   
    let manager = CoreDataManager.instance

    func getCategories() -> [Category] {
        var categoryList = [Category]()

        let request = NSFetchRequest<CategoryEntity>(entityName: Constants.CORE_DATA.CategoryEntity)
        do {
            let categories = try manager.context.fetch(request)

            for category in categories {
                let c = category.convertToCategory()
                // print(c.title)
                categoryList.append(c)
            }

        } catch {
            print("Error Fetching.. \(error.localizedDescription)")
        }

        return categoryList
    }

    func addCategory(category: Category) {
        let newCat = CategoryEntity(context: manager.context)
        newCat.title = category.title
        newCat.icon = category.iconImage
        newCat.id = category.id
        newCat.colorCode = category.color.toHex()

        // print("U>> Color Code \(category.color.toHex())")

        save()
    }

    func addCategoryList(categories: [Category]) {
        addCategoryListByBatch(categories: categories)
//        manager.container.performBackgroundTask { context in
//
//            categories.forEach { category in
//                let catEntity = CategoryEntity(context: context)
//                catEntity.title = category.title
//                catEntity.icon = category.iconImage
//                catEntity.id = category.id
//                catEntity.colorCode = category.color.toHex()
//            }
//
//            if context.hasChanges {
//                try? context.save()
//            }
//        }
    }

    func addCategoryListByBatch(categories: [Category]) {
        manager.container.performBackgroundTask { context in

            let request = self.createBatchRequest(categories: categories)
            do {
                try context.execute(request)
            } catch {
                debugPrint("Batch Insert Error - \(error.localizedDescription)")
            }
        }
    }

    private func createBatchRequest(categories: [Category]) -> NSBatchInsertRequest {
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

    func save() {
        self.manager.save()
    }
}
