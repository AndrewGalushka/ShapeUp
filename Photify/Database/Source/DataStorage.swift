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
    
    init(adapter: DataStorageAdapter = CoreDataManagerAdapter(coreDataManager: CoreDataManager())) {
        self.dataStorageAdapter = adapter
    }
    
    func load(competion: @escaping () -> Void) {
        self.dataStorageAdapter.load {
            competion()
        }
    }
}
