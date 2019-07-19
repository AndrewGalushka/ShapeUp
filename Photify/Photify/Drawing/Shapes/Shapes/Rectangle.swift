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
        let path = CGMutablePath()
        let size = rect.size
        
        let p1 = CGPoint(x: 0, y: 0)
        let p2 = CGPoint(x: size.width, y: 0)
        let p3 = CGPoint(x: size.width, y: size.height)
        let p4 = CGPoint(x: 0, y: size.height)
        
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p4)
        path.closeSubpath()
        
        return path
    }
}


