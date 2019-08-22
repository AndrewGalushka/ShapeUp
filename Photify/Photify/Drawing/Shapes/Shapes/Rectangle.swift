//
//  Rectangle.swift
//  Photify
//
//  Created by Galushka on 7/8/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

struct Rectangle: Shape {
    func path(in rect: CGRect) -> CGPath {
        let xOrigin = rect.origin.x
        let yOrigin = rect.origin.y
        
        let path = CGMutablePath()
        
        let p1 = CGPoint(x: xOrigin, y: yOrigin)
        let p2 = CGPoint(x: rect.maxX, y: yOrigin)
        let p3 = CGPoint(x: rect.maxX, y: rect.maxY)
        let p4 = CGPoint(x: xOrigin, y: rect.maxY)
        
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p4)
        path.closeSubpath()
        
        return path
    }
}


