//
//  GridView.swift
//  Photify
//
//  Created by Galushka on 8/5/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

@IBDesignable
class GridView: UIView {
    let shape = Grid()
    
    @IBInspectable
    var lineColor: UIColor? {
        get {
            
            if let strokeColor = shapeLayer.strokeColor {
                return UIColor(cgColor: strokeColor)
            }
            
            return nil
        }
        
        set (color) {
            shapeLayer.strokeColor = color?.cgColor
        }
    }
    
    @IBInspectable
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
    
    var shapeLayer: CAShapeLayer {
        return self.layer as! CAShapeLayer
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.shapeLayer.fillColor = nil
        self.shapeLayer.strokeColor = UIColor.cyan.withAlphaComponent(0.3).cgColor
        self.shapeLayer.lineWidth = 1.0
    }
}

