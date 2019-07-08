//
//  CircleGeometry.swift
//  Photify
//
//  Created by Galushka on 7/8/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

extension Geometry {
    
    struct Circle {
        let center: CGPoint
        let radius: CGFloat
        
        init(center: CGPoint, radius: CGFloat) {
            self.center = center
            self.radius = radius
        }
    }
}
