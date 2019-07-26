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
