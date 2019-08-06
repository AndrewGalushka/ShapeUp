//
//  DataStorageAdapter.swift
//  Database
//
//  Created by Galushka on 8/1/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

public protocol DataStorageAdapter: CanvasStore, CanvasShapesViewsStore {
    func load(completion: @escaping () -> Void)
}

public protocol CanvasStore {
    func fetchAllCanvases() -> [CanvasDTO]
    func saveCanvases(_ canvas: [CanvasDTO])
    func deleteCanvases(identifiers: [UUID])
}

public protocol CanvasShapesViewsStore {
    func fetchAllShapesViews(inside canvas: CanvasDTO) -> CanvasDTO?
    func fetchAllShapesViews(inside canvasWithID: UUID) -> CanvasDTO?
    
    func addShapesViews(_ shapeViewDTOs: [ShapeViewDTO], to canvas: CanvasDTO)
    func addShapesViews(_ shapeViewDTOs: [ShapeViewDTO], to canvasWithID: UUID)
}


