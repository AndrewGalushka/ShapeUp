//
//  ColoredCircleView.swift
//  Photify
//
//  Created by Galushka on 7/24/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

@IBDesignable
class ColoredCircleView: UIView {
    
    @IBInspectable
    var color: UIColor? {
        get {
            return self.backgroundColor
        }
        
        set {
            self.backgroundColor = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        recalculateCornerRadiusAndSet()
    }
    
    private func setup() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        recalculateCornerRadiusAndSet()
    }
    
    private func recalculateCornerRadiusAndSet() {
        let minLength = min(bounds.width, bounds.height)
        self.layer.cornerRadius = minLength / 2.0
    }
}
