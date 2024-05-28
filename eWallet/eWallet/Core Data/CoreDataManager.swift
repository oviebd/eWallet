//
//  CoreDataManager.swift
//  eWallet
//
//  Created by Habibur Rahman on 17/5/24.
//


import CoreData
import Foundation

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
  
        whereIsMySQLite()
    }
    
    func save(){
        do{
            try context.save()
            debugPrint("Save SuccessFully")
        }catch{
            debugPrint("Error Saving Corae Data - \(error.localizedDescription)")
        }
    }
    
    
    private func whereIsMySQLite() {
        let path = NSPersistentContainer
            .defaultDirectoryURL()
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding

        debugPrint("D>> \(path)")
    }
}

  
    

