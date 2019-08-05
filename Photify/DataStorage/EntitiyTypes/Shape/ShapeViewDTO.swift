//
//  ShapeDTO.swift
//  DataStorage
//
//  Created by Galushka on 8/2/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

public struct ShapeViewDTO {
    public var xOrigin: Float
    public var yOrigin: Float
    public var height: Float
    public var width: Float
    public var metadata: Data?
    
    public init(xOrigin: Float, yOrigin: Float, height: Float, width: Float, metadata: Data?) {
        self.xOrigin = xOrigin
        self.yOrigin = yOrigin
        self.height = height
        self.width = width
        self.metadata = metadata
    }
}
