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
        
        func pointOnArc(angle: Angle) -> CGPoint {
            return CGPoint(x: Double(center.x) + Double(radius) * cos(angle.radians),
                           y: Double(center.y) + Double(radius) * sin(angle.radians))
        }
    }
}
