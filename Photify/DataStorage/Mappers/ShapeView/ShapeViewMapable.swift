//
//  ShapeViewMapable.swift
//  DataStorage
//
//  Created by Galushka on 8/5/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

protocol ShapeViewMapable {
    func translate(shapeView: ShapeView) -> ShapeViewDTO
    func translate(shapeViewDTO: ShapeViewDTO, moc: NSManagedObjectContext) -> ShapeView
    
    func translate(shapeViews: [ShapeView]) -> [ShapeViewDTO]
    func translate(shapeViewsDTOs: [ShapeViewDTO], moc: NSManagedObjectContext) -> [ShapeView]
}

extension ShapeViewMapable {
    func translate(shapeViews: [ShapeView]) -> [ShapeViewDTO] {
        return shapeViews.map {
            self.translate(shapeView: $0)
        }
    }
    
    func translate(shapeViewsDTOs: [ShapeViewDTO], moc: NSManagedObjectContext) -> [ShapeView] {
        return shapeViewsDTOs.map {
            self.translate(shapeViewDTO: $0, moc: moc)
        }
    }
}
