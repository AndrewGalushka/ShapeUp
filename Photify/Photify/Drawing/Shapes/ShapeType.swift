//
//  ShapeType.swift
//  Photify
//
//  Created by Galushka on 8/1/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

enum ShapeType: Int {
    case rectangle
    case circle
    case ellipse
    case hexagon
    case triangle
    case star
    case xMark
}

extension ShapeType: Codable {
}
