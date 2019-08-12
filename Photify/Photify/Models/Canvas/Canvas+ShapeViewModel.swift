//
//  Canvas+ShapeViewModel.swift
//  Photify
//
//  Created by Galushka on 8/6/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

extension Canvas {
    struct ShapeView {
        var origin: CGPoint
        var size: CGSize
        var shapeType: ShapeType
        var color: Color?
    }
}
