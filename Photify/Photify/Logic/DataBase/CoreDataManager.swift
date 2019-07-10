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
    private(set) var isLoaded = false
    
    // MARK: - Initializers
    
    init() {
        persistentContainer = PersistentContainer(name: CoreDataManager.dataModelFileName)
        persistentContainer.loadPersistentStores { [weak self] (storeDescription, error) in
            
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
            
            self?.isLoaded = true
        }
    }
}

extension CoreDataManager {
    static let dataModelFileName = "ManagedObjectModel"
}
