//
//  CoreDataEntityMapper+ShapeView.swift
//  DataStorage
//
//  Created by Galushka on 8/5/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

extension CoreDataEntityMapper: ShapeViewMapable {
    
    func translate(shapeView: ShapeView) -> ShapeViewDTO {
        let origin = ShapeViewDTO.Point(x: shapeView.xOrigin,
                                        y: shapeView.yOrigin)
        let size = ShapeViewDTO.Size(width: shapeView.width,
                                     height: shapeView.height)
        
        return ShapeViewDTO(origin: origin,
                            size: size)
    }
    
    func translate(shapeViewDTO: ShapeViewDTO, moc: NSManagedObjectContext) -> ShapeView {
        let shapeView = ShapeView(context: moc)
        shapeView.xOrigin = shapeViewDTO.origin.x
        shapeView.yOrigin = shapeViewDTO.origin.y
        shapeView.width = shapeViewDTO.size.width
        shapeView.height = shapeViewDTO.size.height
        
        return shapeView
    }
}
