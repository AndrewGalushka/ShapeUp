//
//  CGRect.swift
//  Photify
//
//  Created by Galushka on 7/30/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

extension CGRect {
    init(center: CGPoint, size: CGSize) {
        let origin = CGPoint(x: center.x - size.width / 2.0,
                             y: center.y - size.height / 2.0)
        
        self.init(origin: origin, size: size)
    }
}
