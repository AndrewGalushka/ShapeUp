//
//  Circle.swift
//  Photify
//
//  Created by Galushka on 7/8/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

struct Circle: Shape {
    func path(in rect: CGRect) -> CGPath {
        let originalSize = rect.size
        let originalCenter = CGPoint(x: originalSize.width / 2,
                                     y: originalSize.height / 2)
        
        let minLength = min(originalSize.width, originalSize.height)
        let newSize = CGSize(width: minLength, height: minLength)
        let newOrigin = CGPoint(x: originalCenter.x - newSize.width / 2,
                                y: originalCenter.y - newSize.height / 2)
        
        return CGPath(ellipseIn: CGRect(origin: newOrigin, size: newSize), transform: nil)
    }
}
