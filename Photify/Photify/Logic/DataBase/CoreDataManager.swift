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
}

private extension CoreDataManager {
    static let dataModelFileName = "ManagedObjectModel"
}
