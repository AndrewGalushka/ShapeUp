//
//  Star.swift
//  Photify
//
//  Created by Galushka on 7/9/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

struct Star: Shape {
    func path(in rect: CGRect) -> CGPath {
        let minLength = min(rect.width, rect.height)
        let initialAngle: Double = -90
        let stepDegrees: Double = 75
        let circle = Geometry.Circle(center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                                     radius: minLength / 2)
        
        let p1 = circle.pointOnArc(angle: Geometry.Angle(degrees: initialAngle))
        let p2 = circle.pointOnArc(angle: Geometry.Angle(degrees: initialAngle + stepDegrees))
        let p3 = circle.pointOnArc(angle: Geometry.Angle(degrees: initialAngle + stepDegrees * 2))
        let p4 = circle.pointOnArc(angle: Geometry.Angle(degrees: initialAngle - stepDegrees))
        let p5 = circle.pointOnArc(angle: Geometry.Angle(degrees: initialAngle - stepDegrees * 2))
        
        let path = CGMutablePath()
        
        path.move(to: p1)
        path.addLine(to: p3)
        path.addLine(to: p4)
        path.addLine(to: p2)
        path.addLine(to: p5)
        path.closeSubpath()
        
        return path
    }
}
