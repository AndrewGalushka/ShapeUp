//
//  DataStorage.swift
//  Database
//
//  Created by Galushka on 7/31/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

public final class DataStorage {
    private let dataStorageAdapter: DataStorageAdapter
    
    public init() {
        self.dataStorageAdapter = CoreDataManagerAdapter(coreDataManager: CoreDataManager())
    }
    
    public func load(competion: @escaping () -> Void) {
        self.dataStorageAdapter.load {
            competion()
        }
    }
    
    public func fetchAllCanvases() -> [CanvasDTO] {
        return dataStorageAdapter.fetchAllCanvases()
    }
    
    public func saveCanvases(_ canvases: [CanvasDTO]) {
        dataStorageAdapter.saveCanvases(canvases)
    }
    
    public func deleteCanvases(identifiers: [UUID]) {
        dataStorageAdapter.deleteCanvases(identifiers: identifiers)
    }
}
