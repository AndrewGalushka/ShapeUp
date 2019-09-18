//
//  CanvasRendererView.swift
//  Photify
//
//  Created by Galushka on 8/16/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit
import CoreGraphics

@IBDesignable
class CanvasRendererView: UIView {
    
    // MARK: - Properties(Private)
    
    private var shapes = [Canvas.ShapeView]()
    
    // MARK: - Lifecycle
    
    override func draw(_ rect: CGRect) {
        guard let commandsBuilder = CanvasDrawingCommandsBuilderFactory.makeDefault() else { return }
        
        commandsBuilder
            .background(Color(uiColor: Design.Colors.canvasBackgroundWhite))
            .shapes(shapes)
            .build()
            .draw(in: rect)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    // MARK: - Methods(Public)
        
    func addShape(_ shape: Canvas.ShapeView) {
        self.shapes.append(shape)
        setNeedsDisplay()
    }
    
    func setShapes(_ shapes: [Canvas.ShapeView]) {
        self.shapes = shapes
        setNeedsDisplay()
    }
}

enum CanvasDrawingCommandsBuilderFactory {
    static func makeDefault() -> DrawingCommandsBuilder? {
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        return CGDrawingCommandsBuilder(cgContext: context)
    }
}
