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
    public var color: ColorDTO?
    public var shapeType: Int32
    
    public init(origin: ShapeViewDTO.Point, size: ShapeViewDTO.Size, shapeType: Int32, color: ColorDTO?) {
        self.origin = origin
        self.size = size
        self.color = color
        self.shapeType = shapeType
    }
}

public extension ShapeViewDTO {
    struct Point {
        public var x, y: Float
        
        public init(x: Float, y: Float) {
            self.x = x
            self.y = y
        }
    }
    
    struct Size {
        public var width, height: Float
        
        public init(width: Float, height: Float) {
            self.width = width
            self.height = height
        }
    }
}
