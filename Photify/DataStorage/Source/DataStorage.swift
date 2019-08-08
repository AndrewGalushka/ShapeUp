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
    
    // MARK: - Canvas
    
    public func fetchAllCanvases() -> [CanvasDTO] {
        return dataStorageAdapter.fetchAllCanvases()
    }
    
    public func saveCanvases(_ canvases: [CanvasDTO]) {
        dataStorageAdapter.saveCanvases(canvases)
    }
    
    public func deleteCanvases(identifiers: [UUID]) {
        dataStorageAdapter.deleteCanvases(identifiers: identifiers)
    }
    
    // MARK: - ShapeView
    
    public func fetchShapeViews(inside canvas: CanvasDTO) -> CanvasDTO? {
        return self.dataStorageAdapter.fetchShapeViews(inside: canvas)
    }
    
    public func fetchShapeViews(inside canvasWithID: UUID) -> CanvasDTO? {
        return self.dataStorageAdapter.fetchShapeViews(inside: canvasWithID)
    }
    
    public func addShapeViews(_ shapeViewDTOs: [ShapeViewDTO], to canvas: CanvasDTO) -> CanvasDTO? {
        return self.dataStorageAdapter.addShapeViews(shapeViewDTOs, to: canvas)
    }
}
