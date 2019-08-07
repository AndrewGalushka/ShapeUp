//
//  CoreDataManagerAdapter+ShapeViewsStorable.swift
//  DataStorage
//
//  Created by Galushka on 8/6/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

extension CoreDataManagerAdapter: CanvasShapeViewsStorable {
    func fetchAllShapesViews(inside canvas: CanvasDTO) -> CanvasDTO? {
        fatalError()
    }
    
    func fetchAllShapesViews(inside canvasWithID: UUID) -> CanvasDTO? {
        fatalError()
    }
    
    func addShapesViews(_ shapeViewDTOs: [ShapeViewDTO], to canvas: CanvasDTO) {
        fatalError()
    }
    
    func addShapesViews(_ shapeViewDTOs: [ShapeViewDTO], to canvasWithID: UUID) {
        fatalError()
    }
}
