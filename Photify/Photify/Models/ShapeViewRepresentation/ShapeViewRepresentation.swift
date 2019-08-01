//
//  ShapeViewModel.swift
//  Photify
//
//  Created by Galushka on 8/1/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

struct ShapeViewRepresentation: Codable {
    let shapeStyle: ShapeStyle
    let shapeType: ShapeType
}

extension ShapeViewRepresentation {
    var shape: Shape {
        return ShapeViewRepresentation.shapeFromShapeType(shapeType)
    }
    
    static func shapeFromShapeType(_ shapeType: ShapeType) -> Shape {
        switch shapeType {
        case .rectangle:
            return Rectangle()
        case .circle:
            return Circle()
        case .ellipse:
            return Ellipse()
        case .hexagon:
            return Hexagon()
        case .triangle:
            return Triangle(alignment: .center)
        case .star:
            return Star()
        case .xMark:
            return XMark()
        }
    }
}
