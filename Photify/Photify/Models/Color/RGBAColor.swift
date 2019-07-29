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
    static var white: Self {
        return Self(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
