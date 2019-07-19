//
//  Ellipse.swift
//  Photify
//
//  Created by Galushka on 7/8/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

struct Ellipse: Shape {
    func path(in rect: CGRect) -> CGPath {
        return CGPath(ellipseIn: rect, transform: nil)
    }
}
