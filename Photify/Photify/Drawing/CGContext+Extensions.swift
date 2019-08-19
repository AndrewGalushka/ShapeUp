//
//  CGContext+Extensions.swift
//  Photify
//
//  Created by Galushka on 8/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import QuartzCore

extension CGContext {
    func drawAction(_ drawAction: () -> Void ) {
        saveGState()
        drawAction()
        restoreGState()
    }
    
    func setFillColor(_ color: RGBAColor) {
        self.setFillColor(red: CGFloat(color.red),
                          green: CGFloat(color.green),
                          blue: CGFloat(color.blue),
                          alpha: CGFloat(color.alpha))
    }
    
    func setStrokeColor(_ color: RGBAColor) {
        self.setStrokeColor(red: CGFloat(color.red),
                            green: CGFloat(color.green),
                            blue: CGFloat(color.blue),
                            alpha: CGFloat(color.alpha))
    }
}
