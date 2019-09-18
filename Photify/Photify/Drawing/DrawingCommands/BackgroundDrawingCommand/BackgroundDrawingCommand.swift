//
//  BackgroundDrawingCommand.swift
//  Photify
//
//  Created by Galushka on 9/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

protocol BackgroundDrawingCommand: DrawingCommand {
    var color: RGBAColor { get }
}

class CGBackgroundDrawingCommand: BackgroundDrawingCommand, CGDrawingCommand {
    let color: RGBAColor
    let cgContext: CGContext
    
    init(color: RGBAColor, cgContext: CGContext) {
        self.color = color
        self.cgContext = cgContext
    }
    
    func draw(using context: CGContext, in rect: CGRect) {
        
        context.drawAction {
            context.setFillColor(color.uiColor.cgColor)
            context.fill(rect)
        }
    }
}
