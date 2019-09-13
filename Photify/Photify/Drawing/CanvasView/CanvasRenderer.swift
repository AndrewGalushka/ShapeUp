//
//  CanvasRenderer.swift
//  Photify
//
//  Created by Galushka on 9/13/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

class CanvasRenderer {
    let context: CGContext
    
    init(context: CGContext) {
        self.context = context
    }
    
    func render(in rect: CGRect, drawingCommand: DrawingCommands) {
        self.renderBackground(rect, color: drawingCommand.background)
        self.renderShapes(drawingCommand.shapes)
    }
    
    private func renderBackground(_ rect: CGRect, color: Color) {
        context.drawAction {
            context.setFillColor(red: CGFloat(color.red),
                                 green: CGFloat(color.green),
                                 blue: CGFloat(color.blue),
                                 alpha: CGFloat(color.alpha))
            context.fill(rect)
        }
    }
    
    private func renderShapes(_ shapes: [Canvas.ShapeView]) {
        
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

extension CanvasRenderer {
    
    struct DrawingCommands {
        let background: Color
        let shapes: [Canvas.ShapeView]
    }
}
