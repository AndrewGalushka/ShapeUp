//
//  Shape.swift
//  Photify
//
//  Created by Galushka on 7/8/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation
import CoreGraphics

protocol Shape {
    func path(in rect: CGRect) -> CGPath
}
