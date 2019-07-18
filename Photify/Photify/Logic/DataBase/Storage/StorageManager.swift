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
    private let coreDataManager: CoreDataManager
    private init() {
        coreDataManager = CoreDataManager()
    }
    
    static func loadStorage() -> StorageManager {
        let semaphore = DispatchSemaphore(value: 0)
        let storage = StorageManager()
        
        storage.coreDataManager.loadStorage {
            semaphore.signal()
        }
        
        semaphore.wait()
        return storage
    }
    
    
    func addCanvas() {
    
    }
    
    func fetchAllCanvases() -> [CanvasType] {
        let fetchCanvasesRequest = NSFetchRequest<CanvasEntity>()
        
        do {
            let canvases = try coreDataManager.fetch(fetchCanvasesRequest)
            return []
        } catch {
            return []
        }
    }
}
