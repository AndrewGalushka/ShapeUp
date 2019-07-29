//
//  ShapeStyle+Line.swift
//  Photify
//
//  Created by Galushka on 7/29/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import QuartzCore

extension ShapeStyle {
    struct LineStyle: Codable {
        var width: Float = 0.0
        var strokeColor: Color = .clear
        var lineJoin: LineJoin = .miter
    }
}

extension ShapeStyle.LineStyle {
    enum LineJoin: String, Codable {
        case miter
        case round
        case bevel
    }
}
