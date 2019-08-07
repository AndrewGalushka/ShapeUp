//
//  StoreManager.swift
//  Photify
//
//  Created by Galushka on 7/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation
import DataStorage

final class StorageManager: StorageLoadable {
    
    let dataStorage = DataStorage()
    let translator: StorageModelsTranslatable = StorageModelsTranslator()
    
    // MARK: Private Initializer
    
    private init() {}
    
    // MARK: Public Initializer
    
    static func loadStorage() -> StorageManager {
        let semaphore = DispatchSemaphore(value: 0)
        let storageManager = StorageManager()
        
        storageManager.dataStorage.load {
            semaphore.signal()
        }
        
        semaphore.wait()
        
        return storageManager
    }
}
