//
//  UIColor+RGBAColor.swift
//  Photify
//
//  Created by Galushka on 7/26/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(rbgaColor: RGBAColor) {
        self.init(red: CGFloat(rbgaColor.red),
                  green: CGFloat(rbgaColor.green),
                  blue: CGFloat(rbgaColor.blue),
                  alpha: CGFloat(rbgaColor.alpha))
    }
}

extension RGBAColor {
    init(uiColor: UIColor) {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        self.init(red: Float(red),
                  green: Float(green),
                  blue: Float(blue),
                  alpha: Float(alpha))
    }
}
