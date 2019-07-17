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
    private(set) var isLoaded: AtomicProperty<Bool> = .init(value: false)
    
    // MARK: - Initializers
    
    init() {
        persistentContainer = PersistentContainer(name: CoreDataManager.dataModelFileName)
    }
    
    func loadStorage(completion: @escaping () -> Void) {
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
            
            self.isLoaded.value = true
            completion()
        }
    }
}

private extension CoreDataManager {
    static let dataModelFileName = "ManagedObjectModel"
}
