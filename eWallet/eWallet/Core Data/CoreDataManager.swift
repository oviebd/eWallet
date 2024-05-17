//
//  CoreDataManager.swift
//  eWallet
//
//  Created by Habibur Rahman on 17/5/24.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager()
    let container : NSPersistentContainer
    let context : NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: Constants.CORE_DATA.dataContainer)
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error Loading Core Data - \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save(){
        do{
            try context.save()
            print("Save SuccessFully")
        }catch{
            print("Error Saving Corae Data - \(error.localizedDescription)")
        }
    }
}
