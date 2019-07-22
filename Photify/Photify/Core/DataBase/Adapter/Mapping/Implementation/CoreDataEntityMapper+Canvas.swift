//
//  CoreDataEntityMapper+Canvas.swift
//  Photify
//
//  Created by Galushka on 7/18/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

extension CoreDataEntityMapper: CanvasEntityMapable {
    
    struct CanvasModel: Photify.Canvas {
        var identifier: UUID
        var name: String
    }
    
    func mapOut(canvasEntities: [CanvasEntity]) -> [Photify.Canvas] {
        let canvases: [Canvas] = canvasEntities.map {
           self.mapOut($0)
        }
        
        return canvases
    }
    
    func mapIn(canvases: [Canvas], moc: NSManagedObjectContext) -> [CanvasEntity] {
        let canvasEntities: [CanvasEntity] = canvases.map {
            self.mapIn($0, moc: moc)
        }
        
        return canvasEntities
    }
    
    private func mapOut(_ canvasEntity: CanvasEntity) -> Photify.Canvas {
        return CanvasModel(identifier: canvasEntity.identifier!, name: canvasEntity.name ?? "")
    }
    
    private func mapIn(_ canvas: Photify.Canvas, moc: NSManagedObjectContext) -> CanvasEntity {
        let canvasEntity = CanvasEntity(context: moc)
        canvasEntity.identifier = canvas.identifier
        canvasEntity.name = canvas.name
        
        return canvasEntity
    }
}
