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
    func fetchCanvasBy(ID: UUID) -> CanvasDTO?
    func fetchAllCanvases() -> [CanvasDTO]
    func saveCanvases(_ canvas: [CanvasDTO])
    func deleteCanvases(identifiers: [UUID])
}

public protocol CanvasShapeViewsStorable {
    func fetchShapeViews(inside canvas: CanvasDTO) -> CanvasDTO?
    func fetchShapeViews(inside canvasWithID: UUID) -> CanvasDTO?
    
    func addShapeViews(_ shapeViewDTOs: [ShapeViewDTO], to canvas: CanvasDTO) -> CanvasDTO?
}


