//
//  ShapeStyle+Fill.swift
//  Photify
//
//  Created by Galushka on 7/29/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import QuartzCore

extension ShapeStyle {
    struct FillStyle: Codable {
        var color: Color = .clear
        var fillRule: FillRule = .nonZero
    }
}

extension ShapeStyle.FillStyle {
    enum FillRule: String, Codable {
        case nonZero
        case evenOdd
    }
}
