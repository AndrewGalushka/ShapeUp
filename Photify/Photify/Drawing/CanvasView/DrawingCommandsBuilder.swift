//
//  DrawingCommandsBuilder.swift
//  Photify
//
//  Created by Galushka on 9/13/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

protocol DrawingCommandsBuilder {
    @discardableResult func background(_ backgroundColor: RGBAColor) -> Self
    @discardableResult func shapes(_ shapes: [Canvas.ShapeView]) -> Self
    @discardableResult func build() -> [DrawingCommand]
}

class CGDrawingCommandsBuilder: DrawingCommandsBuilder {
    private let cgContext: CGContext
    private var commands = [DrawingCommand]()
    
    init(cgContext: CGContext) {
        self.cgContext = cgContext
    }
    
    @discardableResult func background(_ backgroundColor: RGBAColor) -> Self {
        commands.append(CGBackgroundDrawingCommand(color: backgroundColor, cgContext: cgContext))
        return self
    }
    
    @discardableResult func shapes(_ shapes: [Canvas.ShapeView]) -> Self {
        commands.append(CGShapeDrawingCommand(cgContext: cgContext, shapes: shapes))
        return self
    }
    
    func build() -> [DrawingCommand] {
        return commands
    }
}
