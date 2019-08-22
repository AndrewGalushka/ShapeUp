//
//  Utilities.swift
//  Photify
//
//  Created by Galushka on 8/22/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

extension Geometry {
    static func scale(from transform: CGAffineTransform) -> Double {
        return sqrt(Double(transform.a * transform.a + transform.c * transform.c))
    }
}
