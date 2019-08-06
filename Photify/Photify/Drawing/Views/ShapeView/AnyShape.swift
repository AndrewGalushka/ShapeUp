//
//  AnyShape.swift
//  Photify
//
//  Created by Galushka on 7/24/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

struct AnyShape: Shape {
    private let _pathInRect: (_ rect: CGRect) -> CGPath
    
    init(shape: Shape) {
        self._pathInRect = { (rect: CGRect) -> CGPath in
            return shape.path(in: rect)
        }
    }
    
    func path(in rect: CGRect) -> CGPath {
        return _pathInRect(rect)
    }
}
