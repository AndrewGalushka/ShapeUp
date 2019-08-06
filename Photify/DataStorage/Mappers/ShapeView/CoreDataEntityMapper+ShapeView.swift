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
        return ShapeViewDTO(xOrigin: shapeView.xOrigin,
                            yOrigin: shapeView.yOrigin,
                            height: shapeView.height,
                            width: shapeView.width)
    }
    
    private func _mapIn(_ shapeDTO: ShapeViewDTO, moc: NSManagedObjectContext) -> ShapeView {
        let shapeView = ShapeView(context: moc)
        shapeView.xOrigin = shapeDTO.xOrigin
        shapeView.yOrigin = shapeDTO.yOrigin
        shapeView.width = shapeDTO.width
        shapeView.height = shapeDTO.height
        
        return shapeView
    }
}
