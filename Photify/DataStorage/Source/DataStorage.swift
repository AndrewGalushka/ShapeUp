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
    
    public func fetchAllShapesViews(inside canvas: CanvasDTO) -> CanvasDTO? {
        return self.dataStorageAdapter.fetchAllShapesViews(inside: canvas)
    }
    
    public func fetchAllShapesViews(inside canvasWithID: UUID) -> CanvasDTO? {
        return self.dataStorageAdapter.fetchAllShapesViews(inside: canvasWithID)
    }
    
    public func addShapesViews(_ shapeViewDTOs: [ShapeViewDTO], to canvas: CanvasDTO) {
        self.dataStorageAdapter.addShapesViews(shapeViewDTOs, to: canvas)
    }
    
    public func addShapesViews(_ shapeViewDTOs: [ShapeViewDTO], to canvasWithID: UUID) {
        self.dataStorageAdapter.addShapesViews(shapeViewDTOs, to: canvasWithID)
    }
}
