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
        let originalCenter = CGPoint(x: rect.midX,
                                     y: rect.midY)
        
        let minLength = min(originalSize.width, originalSize.height)
        let squareRect = CGRect(center: originalCenter, size: CGSize(width: minLength, height: minLength))
        
        return CGPath(ellipseIn: squareRect, transform: nil)
    }
}
