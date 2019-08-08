//
//  StoreManageable.swift
//  Photify
//
//  Created by Galushka on 7/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation
import DataStorage

typealias StorageManageable = StorageLoadable & CanvasStorable & CanvasShapeViewStorable

protocol StorageLoadable: AnyObject {
    /// Synchronously load persistent storage
    static func loadStorage() -> Self
}

protocol CanvasStorable {
    
    // MARK - Write
    
    func saveCanvases(_ canvases: [Canvas])
    func deleteCanvases(_ canvases: [Canvas])
    
    // MARK - Read
    
    func fetchCanvasBy(ID: UUID) -> Canvas?
    func fetchAllCanvases() -> [Canvas]
}

protocol CanvasShapeViewStorable {
    
    // MARK - Read
    
    // MARK: - Write
    
    func addShapeView(_ shapeView: Canvas.ShapeView, in canvas: Canvas) -> Canvas?
    func addShapeView(_ shapeViews: [Canvas.ShapeView], in canvas: Canvas) -> Canvas?
}


