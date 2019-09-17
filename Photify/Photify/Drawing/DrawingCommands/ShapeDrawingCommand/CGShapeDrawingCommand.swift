//
//  CGShapeDrawingCommand.swift
//  Photify
//
//  Created by Galushka on 9/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

class CGShapeDrawingCommand: ShapeDrawingCommand, CGDrawingCommand {
    let cgContext: CGContext
    let shapes: [Canvas.ShapeView]
    
    init(cgContext: CGContext, shapes: [Canvas.ShapeView]) {
        self.cgContext = cgContext
        self.shapes = shapes
    }
    
    func draw(using context: CGContext, in rect: CGRect) {
        for shapeView in shapes {
            let shapeBkColor = shapeView.color ?? .clear
            let shapeStrokeColor = shapeBkColor.inverted()
            let drawingRect = CGRect(origin: shapeView.origin, size: shapeView.size)
            let shape = ShapesProvider.createShape(basedOn: shapeView.shapeType)
            let path = shape.path(in: drawingRect)
            
            context.drawAction {
                context.setFillColor(shapeBkColor)
                context.setStrokeColor(shapeStrokeColor)
                context.setLineWidth(5.0)
                
                context.beginPath()
                context.addPath(path)
                context.closePath()
                context.drawPath(using: .fillStroke)
            }
        }
    }
}
