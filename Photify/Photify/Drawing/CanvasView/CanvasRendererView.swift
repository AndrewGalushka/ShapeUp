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
    typealias DrawingCommand = Canvas.ShapeView
    
    // MARK: - Properties(Private)
    
    private var drawingCommands: [DrawingCommand] = []
    
    // MARK: - Lifecycle
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let renderer = CanvasRenderer(context: context)
        renderer.render(in: rect, drawingCommand: self.makeDrawingCommand() )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setNeedsDisplay()
    }
    
    // MARK: - Methods(Public)
    
    func setDrawingCommands(_ drawingCommands: [DrawingCommand]) {
        self.drawingCommands = drawingCommands
        setNeedsDisplay()
    }
    
    func addDrawingCommand(_ drawingCommand: DrawingCommand) {
        self.addDrawingCommands([drawingCommand])
    }
    
    func addDrawingCommands(_ drawingCommands: [DrawingCommand]) {
        self.drawingCommands.append(contentsOf: drawingCommands)
        setNeedsDisplay()
    }
    
    // MARK: - Methods(Private)
    
    private func makeDrawingCommand() -> CanvasRenderer.DrawingCommands {
        return CanvasRenderer.DrawingCommands(background: Color(uiColor: Design.Colors.canvasBackgroundWhite),
                                              shapes: self.drawingCommands)
    }
}
