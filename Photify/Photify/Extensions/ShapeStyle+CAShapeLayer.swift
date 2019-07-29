//
//  ShapeStyle+CAShapeLayer.swift
//  Photify
//
//  Created by Galushka on 7/29/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

extension CAShapeLayer {
    func configure(shapeStyle: ShapeStyle) {
        self.fillRule = shapeStyle.fillStyle.fillRule.caFillRule
        self.fillColor = shapeStyle.fillStyle.color.uiColor.cgColor
        
        self.strokeColor = shapeStyle.lineStyle.strokeColor.uiColor.cgColor
        self.lineWidth = CGFloat(shapeStyle.lineStyle.width)
        self.lineJoin = shapeStyle.lineStyle.lineJoin.caLineJoin
    }
}

extension ShapeStyle.FillStyle.FillRule {
    var caFillRule: CAShapeLayerFillRule {
        switch self {
        case .nonZero:
            return .nonZero
        case .evenOdd:
            return .evenOdd
        }
    }
}

extension ShapeStyle.LineStyle.LineJoin {
    var caLineJoin: CAShapeLayerLineJoin {
        switch self {
        case .miter:
            return .miter
        case .round:
            return .round
        case .bevel:
            return .bevel
            
        }
    }
}
