//
//  ShapeView.swift
//  Photify
//
//  Created by Galushka on 7/8/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class ShapeView: UIView {
    var shape: Shape
    
    var fillColor: CGColor? {
        get {
            return self.shapeLayer.fillColor
        }
        
        set(value) {
            self.shapeLayer.fillColor = value
        }
    }
    
    var lineWidth: CGFloat {
        get {
            return self.shapeLayer.lineWidth
        }
        
        set(value) {
            return self.shapeLayer.lineWidth = value
        }
    }
    
    open override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    override func draw(_ rect: CGRect) {
        self.shapeLayer.path = self.shape.path(in: rect)
        super.draw(rect)
    }
    
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        super.draw(layer, in: ctx)
    }
    
    convenience init(shape: Shape) {
        self.init(shape: shape, frame: CGRect.zero)
    }
    
    init(shape: Shape, frame: CGRect) {
        self.shape = shape
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var shapeLayer: CAShapeLayer {
        return self.layer as! CAShapeLayer
    }
}

