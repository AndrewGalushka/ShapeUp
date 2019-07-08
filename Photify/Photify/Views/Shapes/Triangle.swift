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
        let size = rect.size
        let p1: CGPoint
        let p2: CGPoint
        let p3: CGPoint
        
        switch alignment {
        case .left:
            p1 = .init(x: 0, y: 0)
            p2 = .init(x: 0, y: size.height)
            p3 = .init(x: size.width, y: size.height)
        case .right:
            p1 = .init(x: size.width, y: 0)
            p2 = .init(x: size.width, y: size.height)
            p3 = .init(x: 0, y: size.height)
        case .center:
            p1 = .init(x: size.width / 2.0, y: 0)
            p2 = .init(x: size.width, y: size.height)
            p3 = .init(x: 0, y: size.height)
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
