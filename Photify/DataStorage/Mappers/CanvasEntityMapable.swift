//
//  CanvasMapable.swift
//  Photify
//
//  Created by Galushka on 7/18/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

protocol CanvasMapable {
    func mapOut(canvases: [Canvas]) -> [CanvasDTO]
    func mapIn(canvasesDTOs: [CanvasDTO], moc: NSManagedObjectContext) -> [Canvas]
}

