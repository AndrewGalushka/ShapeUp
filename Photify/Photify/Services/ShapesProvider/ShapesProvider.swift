//
//  DrawingShapesProvider.swift
//  Photify
//
//  Created by Galushka on 7/24/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

struct ShapesProvider: ShapeTypeToShapeConvertible {

    func allExistingShapeTypes() -> [ShapeType] {
        return ShapeType.allCases
    }
    
    func allExistingShapes() -> [Shape] {
        return [XMark(),
                Circle(),
                Ellipse(),
                Hexagon(),
                Triangle(),
                Star(),
                Rectangle()]
    }
    
    // MARK: - ShapeTypeToShapeConvertible imp
    
    static func createShape(basedOn shapeType: ShapeType) -> Shape {
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
