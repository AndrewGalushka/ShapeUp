//
//  CanvasShapeViewTranslatable.swift
//  Photify
//
//  Created by Galushka on 8/7/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import DataStorage

protocol CanvasShapeViewMapable {
    func translate(shapeView: Canvas.ShapeView) -> ShapeViewDTO
    func translate(shapeViewDTO: ShapeViewDTO) -> Canvas.ShapeView
    
    func translate(shapeViews: [Canvas.ShapeView]) -> [ShapeViewDTO]
    func translate(shapeViewsDTOs: [ShapeViewDTO]) -> [Canvas.ShapeView]
}

extension CanvasShapeViewMapable {
    func translate(shapeViews: [Canvas.ShapeView]) -> [ShapeViewDTO] {
        return shapeViews.map {
            self.translate(shapeView: $0)
        }
    }
    
    func translate(shapeViewsDTOs: [ShapeViewDTO]) -> [Canvas.ShapeView] {
        return shapeViewsDTOs.map {
            self.translate(shapeViewDTO: $0)
        }
    }
}
