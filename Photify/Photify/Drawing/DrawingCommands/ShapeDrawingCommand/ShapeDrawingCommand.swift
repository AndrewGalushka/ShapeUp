//
//  ShapeDrawingCommand.swift
//  Photify
//
//  Created by Galushka on 9/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

protocol ShapeDrawingCommand: DrawingCommand {
    var shapes: [Canvas.ShapeView] { get }
}
