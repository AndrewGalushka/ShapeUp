//
//  CoreDataEntityMapper+Canvas.swift
//  Photify
//
//  Created by Galushka on 7/18/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

extension CoreDataEntityMapper: CanvasEntityMapable {
    
    func mapOut(canvasEntities: [CanvasEntity]) -> [CanvasDTO] {
        let canvases: [CanvasDTO] = canvasEntities.map {
            self.mapOut($0)
        }
        
        return canvases
    }
    
    func mapIn(canvases: [CanvasDTO], moc: NSManagedObjectContext) -> [CanvasEntity] {
        let canvasEntities: [CanvasEntity] = canvases.map {
            self.mapIn($0, moc: moc)
        }
        
        return canvasEntities
    }
    
    private func mapOut(_ canvasEntity: CanvasEntity) -> CanvasDTO {
        return CanvasDTO(identifier: canvasEntity.identifier!, name: canvasEntity.name ?? "")
    }
    
    private func mapIn(_ canvas: CanvasDTO, moc: NSManagedObjectContext) -> CanvasEntity {
        let canvasEntity = CanvasEntity(context: moc)
        canvasEntity.identifier = canvas.identifier
        canvasEntity.name = canvas.name
        
        return canvasEntity
    }
}
