//
//  CoreDataManager.swift
//  Photify
//
//  Created by Galushka on 7/9/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData
import AtomicProperty

final class CoreDataManager {
    
    // MARK: - Properties(Private)
    
    private let persistentContainer: PersistentContainer
    private(set) var isLoaded: AtomicProperty<Bool> = .init(value: false)
    
    // MARK: - Initializers
    
    init() {
        persistentContainer = PersistentContainer(name: CoreDataManager.dataModelFileName)
    }
    
    func mainContext() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func loadStorage(completion: @escaping () -> Void) {
        persistentContainer.loadPersistentStores { [weak persistentContainer] (storeDescription, error) in
            
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
            
            debugPrint("DB path \(persistentContainer?.persistentStoreCoordinator.persistentStores.first?.url?.path ?? "<<UNKNOWN>>")")
            
            self.isLoaded.value = true
            completion()
        }
    }
    
    func fetch<T: NSManagedObject>(by fetchRequest: NSFetchRequest<T>) throws -> [T] {
        let viewModel = persistentContainer.viewContext
        return try viewModel.fetch(fetchRequest)
    }
    
    func delete<T: NSManagedObject>(by fetchRequest: NSFetchRequest<T>) throws -> [NSManagedObjectID] {
        let viewModel = persistentContainer.viewContext
        
        do {
            let existingEntities = try viewModel.fetch(fetchRequest)
            
            if existingEntities.isEmpty {
                return []
            }
            
            var deletedEntitiesIDs = [NSManagedObjectID]()
            
            for entity in existingEntities {
                deletedEntitiesIDs.append(entity.objectID)
                viewModel.delete(entity)
            }
            
            return deletedEntitiesIDs
            
        } catch let error as NSError {
            print("Deleting error: \(error)")
            
            return []
        }
    }
    
    func save() {
        persistentContainer.saveContext()
    }
}

private extension CoreDataManager {
    static let dataModelFileName = "ManagedObjectModel"
}
