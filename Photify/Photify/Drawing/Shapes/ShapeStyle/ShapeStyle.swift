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
    
    init(strokeColor: Color) {
        self.lineStyle.strokeColor = strokeColor
    }
    
    init(lineStyle: LineStyle, fillStyle: FillStyle) {
        self.lineStyle = lineStyle
        self.fillStyle = fillStyle
    }
}
