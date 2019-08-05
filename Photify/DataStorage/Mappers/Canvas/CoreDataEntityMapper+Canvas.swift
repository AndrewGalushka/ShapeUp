//
//  CoreDataEntityMapper+Canvas.swift
//  Photify
//
//  Created by Galushka on 7/18/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

extension CoreDataEntityMapper: CanvasMapable {
    
    func mapOut(canvases: [Canvas]) -> [CanvasDTO] {
        let canvases: [CanvasDTO] = canvases.map {
            self.mapOut($0)
        }
        
        return canvases
    }
    
    func mapIn(canvasesDTOs: [CanvasDTO], moc: NSManagedObjectContext) -> [Canvas] {
        let canvasEntities: [Canvas] = canvasesDTOs.map {
            self.mapIn($0, moc: moc)
        }
        
        return canvasEntities
    }
    
    private func mapOut(_ canvas: Canvas) -> CanvasDTO {
        var canvasDTO = CanvasDTO(identifier: canvas.identifier!, name: canvas.name ?? "")
        
        if let shapes = (canvas.shapes?.compactMap { $0 as? ShapeView }) {
            canvasDTO.shapes = self.mapOut(shapeViews: shapes)
        }
        
        return canvasDTO
    }
    
    private func mapIn(_ canvasDTO: CanvasDTO, moc: NSManagedObjectContext) -> Canvas {
        let canvas = Canvas(context: moc)
        canvas.identifier = canvasDTO.identifier
        canvas.name = canvasDTO.name
        
        let shapesDTOs = self.mapIn(shapeViewsDTOs: canvasDTO.shapes, moc: moc)
        
        if !shapesDTOs.isEmpty  {
            canvas.addToShapes(NSSet(array: shapesDTOs))
        }
        
        return canvas
    }
}
