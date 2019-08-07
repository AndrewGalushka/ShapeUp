//
//  CoreDataManagerAdapter.swift
//  Photify
//
//  Created by Galushka on 7/18/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

class CoreDataManagerAdapter: DataStorageAdapterLoadable {
    let coreDataManager: CoreDataManager
    let mapper: CoreDataEntityMapable
    
    init(coreDataManager: CoreDataManager, mapper: CoreDataEntityMapable = CoreDataEntityMapper()) {
        self.coreDataManager = coreDataManager
        self.mapper = mapper
    }
    
    func load(completion: @escaping () -> Void) {
        self.coreDataManager.loadStorage {
            completion()
        }
    }
}
