//
//  StoreManager.swift
//  Photify
//
//  Created by Galushka on 7/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation
import DataStorage

final class StorageManager: StorageManagerType {
    
    // MARK: Properties(Private)
    
    private let dataStorage = DataStorage()
    
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
    
    // MARK: - Methods(Public)
    
    func saveCanvases(_ canvases: [CanvasStorable]) {
        dataStorage.saveCanvases(canvases)
    }
    
    func fetchAllCanvases() -> [CanvasStorable] {
        return dataStorage.fetchAllCanvases()
    }
    
    func deleteCanvases(_ canvases: [CanvasStorable]) {
        self.dataStorage.deleteCanvases(identifiers: canvases.map { $0.identifier })
    }
}
