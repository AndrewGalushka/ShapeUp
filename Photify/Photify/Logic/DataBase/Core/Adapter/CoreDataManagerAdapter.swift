//
//  CoreDataManagerAdapter.swift
//  Photify
//
//  Created by Galushka on 7/18/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

class CoreDataManagerAdapter: DataBaseAdapter {
    let coreDataManager: CoreDataManager
    private let mapper: CoreDataEntityMapable
    
    init(coreDataManager: CoreDataManager, mapper: CoreDataEntityMapable = CoreDataEntityMapper()) {
        self.coreDataManager = coreDataManager
        self.mapper = mapper
    }
    
    func fetchAllCanvases() -> [Canvas] {
        let fetchCanvasesRequest: NSFetchRequest<CanvasEntity> = CanvasEntity.fetchRequest()
        
        do {
            let canvasEntities = try coreDataManager.fetch(fetchCanvasesRequest)
            let canvases = mapper.mapOut(canvasEntities: canvasEntities)
            return canvases
        } catch (let error as NSError) {
            print("fetchAllCanvases Error: \(error.localizedDescription)")
            return []
        }
    }
    
    func saveCanvases(_ canvases: [Canvas]) {
        let canvasEntities = mapper.mapIn(canvases: canvases, moc: self.coreDataManager.mainContext())
        print(canvasEntities)
        coreDataManager.save()
    }
}
