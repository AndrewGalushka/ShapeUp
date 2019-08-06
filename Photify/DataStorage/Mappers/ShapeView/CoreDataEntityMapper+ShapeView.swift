//
//  CoreDataEntityMapper+ShapeView.swift
//  DataStorage
//
//  Created by Galushka on 8/5/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

extension CoreDataEntityMapper: ShapeViewMapable {
    func mapOut(shapeViews: [ShapeView]) -> [ShapeViewDTO] {
        return shapeViews.map {
            self._mapOut($0)
        }
    }
    
    func mapIn(shapeViewsDTOs: [ShapeViewDTO], moc: NSManagedObjectContext) -> [ShapeView] {
        return shapeViewsDTOs.map {
            self._mapIn($0, moc: moc)
        }
    }
    
    private func _mapOut(_ shapeView: ShapeView) -> ShapeViewDTO {
        let origin = ShapeViewDTO.Point(x: shapeView.xOrigin,
                                        y: shapeView.yOrigin)
        let size = ShapeViewDTO.Size(width: shapeView.width,
                                     height: shapeView.height)
        
        return ShapeViewDTO(origin: origin,
                            size: size)
    }
    
    private func _mapIn(_ shapeDTO: ShapeViewDTO, moc: NSManagedObjectContext) -> ShapeView {
        let shapeView = ShapeView(context: moc)
        shapeView.xOrigin = shapeDTO.origin.x
        shapeView.yOrigin = shapeDTO.origin.y
        shapeView.width = shapeDTO.size.width
        shapeView.height = shapeDTO.size.height
        
        return shapeView
    }
}
