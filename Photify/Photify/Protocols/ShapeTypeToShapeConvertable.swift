//
//  ShapeTypeToShapeConvertable.swift
//  Photify
//
//  Created by Galushka on 8/13/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol ShapeTypeToShapeConvertible {
    func convertToShape(from shapeType: ShapeType) -> Shape
    static func convertToShape(from shapeType: ShapeType) -> Shape
}
