//
//  ShapeViewMapable.swift
//  DataStorage
//
//  Created by Galushka on 8/5/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

protocol ShapeViewMapable {
    func mapOut(shapeViews: [ShapeView]) -> [ShapeViewDTO]
    func mapIn(shapeViewsDTOs: [ShapeViewDTO], moc: NSManagedObjectContext) -> [ShapeView]
}
