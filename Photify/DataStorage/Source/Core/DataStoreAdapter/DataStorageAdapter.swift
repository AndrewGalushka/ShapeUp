//
//  DataStorageAdapter.swift
//  Database
//
//  Created by Galushka on 8/1/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

typealias DataStorageAdapter = DataStorageAdapterLoadable & CanvasStorable & CanvasShapeViewsStorable

public protocol DataStorageAdapterLoadable: AnyObject {
    func load(completion: @escaping () -> Void)
}

public protocol CanvasStorable {
    func fetchAllCanvases() -> [CanvasDTO]
    func saveCanvases(_ canvas: [CanvasDTO])
    func deleteCanvases(identifiers: [UUID])
}

public protocol CanvasShapeViewsStorable {
    func fetchAllShapesViews(inside canvas: CanvasDTO) -> CanvasDTO?
    func fetchAllShapesViews(inside canvasWithID: UUID) -> CanvasDTO?
    
    func addShapesViews(_ shapeViewDTOs: [ShapeViewDTO], to canvas: CanvasDTO) -> CanvasDTO?
}


