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
  
    }
    
    func save(){
        do{
            try context.save()
            debugPrint("Save SuccessFully")
        }catch{
            debugPrint("Error Saving Corae Data - \(error.localizedDescription)")
        }
    }
    
//    
//    private func whereIsMySQLite() {
//        let path = NSPersistentContainer
//            .defaultDirectoryURL()
//            .absoluteString
//            .replacingOccurrences(of: "file://", with: "")
//            .removingPercentEncoding
//
//        debugPrint("D>> \(path)")
//    }
}

class CoreDataManagerModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    @Published var accounts: [AccountEntity] = []
    
    init() {
        getAccounts()
    }
    
    func getAccounts() {
        let request = NSFetchRequest<AccountEntity>(entityName: "AccountEntity")
        
        let sort = NSSortDescriptor(keyPath: \AccountEntity.title, ascending: true)
        request.sortDescriptors = [sort]
        
        do {
           accounts = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func addAccounts() {
        let newAccount = AccountEntity(context: manager.context)
        newAccount.title = "Finance"
        newAccount.amount = 100.0
        newAccount.id = ".com"
        
        
        save()
    }
    
    func save() {
        accounts.removeAll()
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.manager.save()
            self.getAccounts()
            
        }
        
    }
}


  
    

