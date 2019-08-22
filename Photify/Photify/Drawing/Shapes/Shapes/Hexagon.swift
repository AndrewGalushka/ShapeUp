//
//  Hexagon.swift
//  Photify
//
//  Created by Galushka on 7/8/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

struct Hexagon: Shape {
    func path(in rect: CGRect) -> CGPath {
        let size = rect.size
        let minLength = min(size.width, size.height)
        
        let center = CGPoint(x: rect.midX,
                             y: rect.midY)
        let radius = minLength / 2.0
        let stepAngle = Geometry.Angle.degrees(360 / 6)
        
        let path = CGMutablePath()
        
        for i in 0..<6 {
            let x = center.x + radius * CGFloat(cos(stepAngle.radians * Double(i)))
            let y = center.y + radius * CGFloat(sin(stepAngle.radians * Double(i)))
            
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        path.closeSubpath()
        
        return path
    }
}
