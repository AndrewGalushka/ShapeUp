//
//  ShapeTypeToShapeConvertable.swift
//  Photify
//
//  Created by Galushka on 8/13/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol ShapeTypeToShapeConvertible {
    func createShape(basedOn shapeType: ShapeType) -> Shape
    static func createShape(basedOn shapeType: ShapeType) -> Shape
}

extension ShapeTypeToShapeConvertible {
    func createShape(basedOn shapeType: ShapeType) -> Shape {
        return Self.createShape(basedOn: shapeType)
    }
}
