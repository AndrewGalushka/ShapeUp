//
//  CanvasEntityMapable.swift
//  Photify
//
//  Created by Galushka on 7/18/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

protocol CanvasEntityMapable {
    func mapOut(canvasEntities: [CanvasEntity]) -> [CanvasDTO]
    func mapIn(canvases: [CanvasDTO], moc: NSManagedObjectContext) -> [CanvasEntity]
}

