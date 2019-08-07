//
//  CanvasMapable.swift
//  Photify
//
//  Created by Galushka on 7/18/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

protocol CanvasMapable {
    func translate(canvas: Canvas) -> CanvasDTO
    func translate(canvasDTO: CanvasDTO, moc: NSManagedObjectContext) -> Canvas
    
    func translate(canvases: [Canvas]) -> [CanvasDTO]
    func translate(canvasesDTOs: [CanvasDTO], moc: NSManagedObjectContext) -> [Canvas]
}

extension CanvasMapable {
    func translate(canvases: [Canvas]) -> [CanvasDTO] {
        return canvases.map {
            self.translate(canvas: $0)
        }
    }
    
    func translate(canvasesDTOs: [CanvasDTO], moc: NSManagedObjectContext) -> [Canvas] {
        return canvasesDTOs.map {
            self.translate(canvasDTO: $0, moc: moc)
        }
    }
}

