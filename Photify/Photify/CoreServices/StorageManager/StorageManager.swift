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
    private let translator = StorageModelsTranslator()
    
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
    
    func saveCanvases(_ canvases: [Canvas]) {
        let canvasesDTOs = translator.translate(canvases: canvases)
        dataStorage.saveCanvases(canvasesDTOs)
    }
    
    func fetchAllCanvases() -> [Canvas] {
        let results = dataStorage.fetchAllCanvases()
        return translator.translate(canvasDTOs: results)
    }
    
    func deleteCanvases(_ canvases: [Canvas]) {
        self.dataStorage.deleteCanvases(identifiers: canvases.map { $0.identifier })
    }
}
