//
//  UIColor+Extension.swift
//  Photify
//
//  Created by Galushka on 7/18/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: CGFloat.random(in: 0.0...1.0),
                       green: CGFloat.random(in: 0.0...1.0),
                       blue: CGFloat.random(in: 0.0...1.0),
                       alpha: 1.0)
    }
}

// MARK: - Extended Colors

extension UIColor {
    static var spaceGray: UIColor {
        return UIColor(red: 0.40, green: 0.40, blue: 0.40, alpha: 1.0)
    }
    
    // MARK: Blue Shades
    
    static var lightSkyBlue: UIColor {
        return UIColor(red: 0.53, green: 0.81, blue: 0.98, alpha: 1.0)
    }
    
    static var skyBlue: UIColor {
        return UIColor(red:0.53, green:0.81, blue:0.92, alpha:1.0)
    }
    
    static var indigo: UIColor {
        return UIColor(red:0.29, green:0.00, blue:0.51, alpha:1.0)
    }
    
    static var royalblue: UIColor {
        return UIColor(red:0.25, green:0.41, blue:0.88, alpha:1.0)
    }
}
