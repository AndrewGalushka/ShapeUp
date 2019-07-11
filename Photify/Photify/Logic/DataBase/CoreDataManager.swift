//
//  CoreDataManager.swift
//  Photify
//
//  Created by Galushka on 7/9/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

class CoreDataManager {
    
    // MARK: - Properties(Private)
    
    private let persistentContainer: PersistentContainer
    
    // MARK: - Initializers
    
    init(completion: @escaping () -> Void) {
        persistentContainer = PersistentContainer(name: CoreDataManager.dataModelFileName)
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
            
            completion()
        }
    }
    
    convenience init() {
        self.init(completion: {})
    }
    
//    static func foo() {
//        let path = Bundle.main.path(forResource: "ManagedObjectModel", ofType: "momd")!
//        let url = URL(fileURLWithPath: path)
//        let mom = NSManagedObjectModel(contentsOf: url)!
//        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: mom)
//
//        let description = NSPersistentStoreDescription(url: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!)
//        description.type = NSSQLiteStoreType
//        description.shouldMigrateStoreAutomatically = true
//        coordinator.addPersistentStore(with: description) { [weak coordinator] (description, error) in
//            let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//            moc.persistentStoreCoordinator = coordinator
//        }
//
//    }
}

extension CoreDataManager {
    static let dataModelFileName = "ManagedObjectModel"
}
