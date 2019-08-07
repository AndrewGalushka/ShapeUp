//
//  CoreDataEntityMapper+Canvas.swift
//  Photify
//
//  Created by Galushka on 7/18/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

extension CoreDataEntityMapper: CanvasMapable {
    func translate(canvas: Canvas) -> CanvasDTO {
        var canvasDTO = CanvasDTO(identifier: canvas.identifier!, name: canvas.name ?? "")
        
        if let shapes = (canvas.shapes?.compactMap { $0 as? ShapeView }) {
            canvasDTO.shapes = self.translate(shapeViews: shapes)
        }
        
        return canvasDTO
    }
    
    func translate(canvasDTO: CanvasDTO, moc: NSManagedObjectContext) -> Canvas {
        let canvas = Canvas(context: moc)
        canvas.identifier = canvasDTO.identifier
        canvas.name = canvasDTO.name
        
        let shapesDTOs = self.translate(shapeViewsDTOs: canvasDTO.shapes, moc: moc)
        
        if !shapesDTOs.isEmpty  {
            canvas.addToShapes(NSSet(array: shapesDTOs))
        }
        
        return canvas
    }
}
