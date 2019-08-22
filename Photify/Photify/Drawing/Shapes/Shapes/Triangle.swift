//
//  Triangle.swift
//  Photify
//
//  Created by Galushka on 7/8/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

struct Triangle: Shape {
    let alignment: Alignment
    
    init(alignment: Alignment = .center) {
        self.alignment = alignment
    }
    
    func path(in rect: CGRect) -> CGPath {
        let p1: CGPoint
        let p2: CGPoint
        let p3: CGPoint
        
        switch alignment {
        case .left:
            p1 = .init(x: rect.minX, y: rect.minY)
            p2 = .init(x: rect.minX, y: rect.maxY)
            p3 = .init(x: rect.maxX, y: rect.maxY)
        case .right:
            p1 = .init(x: rect.maxX, y: rect.minY)
            p2 = .init(x: rect.maxX, y: rect.maxY)
            p3 = .init(x: rect.minX, y:rect.maxY)
        case .center:
            p1 = .init(x: rect.midX, y: rect.minY)
            p2 = .init(x: rect.maxX, y: rect.maxY)
            p3 = .init(x: rect.minX, y: rect.maxY)
        }
        
        let path = CGMutablePath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.closeSubpath()
        
        return path
    }
}

extension Triangle {
    enum Alignment {
        case left
        case right
        case center
    }
}
