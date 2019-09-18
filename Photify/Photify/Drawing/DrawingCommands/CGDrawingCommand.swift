//
//  CGDrawingCommand.swift
//  Photify
//
//  Created by Galushka on 9/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

protocol CGDrawingCommand: DrawingCommand {
    var cgContext: CGContext { get }
    func draw(using context: CGContext, in rect: CGRect)
}

extension CGDrawingCommand {
    func draw(in rect: CGRect) {
        self.draw(using: self.cgContext, in: rect)
    }
}
