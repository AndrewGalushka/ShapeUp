//
//  StorageModelsTranslator+ShapeView.swift
//  Photify
//
//  Created by Galushka on 8/7/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import DataStorage

extension StorageModelsTranslator: CanvasShapeViewMapable {
    func translate(shapeView: Canvas.ShapeView) -> ShapeViewDTO {
        let origin = ShapeViewDTO.Point(x: Float(shapeView.origin.x),
                                        y: Float(shapeView.origin.y))
        let size = ShapeViewDTO.Size(width: Float(shapeView.size.width),
                                     height: Float(shapeView.size.height))
        var colorDTO: ColorDTO? = nil
        
        if let color = shapeView.color {
            colorDTO = self.translate(color: color)
        }
        
        return ShapeViewDTO(origin: origin, size: size, color: colorDTO)
    }
    
    func translate(shapeViewDTO: ShapeViewDTO) -> Canvas.ShapeView {
        var color: Color? = nil
        
        if let colorDTO = shapeViewDTO.color {
            color = self.translate(colorDTO: colorDTO)
        }
        
        return Canvas.ShapeView(origin: shapeViewDTO.origin.cgPoint,
                                size: shapeViewDTO.size.cgSize,
                                color: color)
    }
}

extension ShapeViewDTO.Point {
    var cgPoint: CGPoint {
        return CGPoint(x: Double(self.x),
                       y: Double(self.y))
    }
}

extension ShapeViewDTO.Size {
    var cgSize: CGSize {
        return CGSize(width: Double(self.width),
                      height: Double(self.height))
    }
}
