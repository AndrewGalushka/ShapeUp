//
//  RGBAColor.swift
//  Photify
//
//  Created by Galushka on 7/26/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol RGBAColor {
    var red: Float { get }
    var green: Float { get }
    var blue: Float { get }
    var alpha: Float { get }
    
    init(red: Float, green: Float, blue: Float, alpha: Float)
}

extension RGBAColor {
    func inverted() -> Self {
        let iRed = 1.0 - red
        let iGreen = 1.0 - green
        let iBlue = 1.0 - blue
        
        return Self(red: iRed, green: iGreen, blue: iBlue, alpha: 1.0)
    }
    
    mutating func invert() {
        let invertedColor = self.inverted()
        self = invertedColor
    }
}

extension RGBAColor {
    static var white: Self {
        return Self(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    static var clear: Self {
        return Self(red: 0, green: 0, blue: 0, alpha: 0)
    }
    
    static var royalBlue: Self {
        return Self(red:0.25, green:0.41, blue:0.88, alpha:1.0)
    }
    
    static var red: Self {
        return Self(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    }
}
