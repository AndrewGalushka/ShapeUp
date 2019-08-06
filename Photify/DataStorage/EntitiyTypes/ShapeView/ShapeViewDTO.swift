//
//  ShapeDTO.swift
//  DataStorage
//
//  Created by Galushka on 8/2/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

public struct ShapeViewDTO {
    public var origin: Point
    public var size: Size
    
    public init(origin: ShapeViewDTO.Point, size: ShapeViewDTO.Size) {
        self.origin = origin
        self.size = size
    }
}

public extension ShapeViewDTO {
    struct Point {
        public var x, y: Float
    }
    
    struct Size {
        public var width, height: Float
    }
}
