//
//  StoreManager.swift
//  Photify
//
//  Created by Galushka on 7/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation
import CoreData

final class StorageManager: StorageManagerType {
    
    // MARK: Properties(Private)
    
    private let coreDataManager: CoreDataManager
    private let dataBaseAdapter: DataBaseAdapter
    
    // MARK: Private Initializer
    
    private init() {
        coreDataManager = CoreDataManager()
        dataBaseAdapter = CoreDataManagerAdapter(coreDataManager: coreDataManager)
    }
    
    // MARK: Public Initializer
    
    static func loadStorage() -> StorageManager {
        let semaphore = DispatchSemaphore(value: 0)
        let storage = StorageManager()
        
        storage.coreDataManager.loadStorage {
            semaphore.signal()
        }
        
        semaphore.wait()
        return storage
    }
    
    // MARK: - Methods(Public)
    
    func saveCanvas(canvas: Canvas) {
        dataBaseAdapter.saveCanvas(canvas)
    }
    
    func fetchAllCanvases() -> [Canvas] {
        return dataBaseAdapter.fetchAllCanvases()
    }
}
