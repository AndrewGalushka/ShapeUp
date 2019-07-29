//
//  ShapeStyle.swift
//  Photify
//
//  Created by Galushka on 7/29/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import QuartzCore

struct ShapeStyle: Codable {
    var fillStyle: FillStyle = FillStyle()
    var lineStyle: LineStyle = LineStyle()
    
    init(fillColor: Color) {
        self.fillStyle.color = fillColor
    }
    
    init(strokeColor: Color, lineWidth: Float = 1.0) {
        self.lineStyle.strokeColor = strokeColor
        self.lineStyle.width = lineWidth
    }
    
    init(lineStyle: LineStyle, fillStyle: FillStyle) {
        self.lineStyle = lineStyle
        self.fillStyle = fillStyle
    }
    
    init() {
        self.lineStyle = LineStyle()
        self.fillStyle = FillStyle()
    }
}

extension ShapeStyle {
    static var empty: ShapeStyle {
        return ShapeStyle()
    }
}
