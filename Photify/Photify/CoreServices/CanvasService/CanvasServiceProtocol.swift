//
//  CanvasServiceProtocol.swift
//  Photify
//
//  Created by Galushka on 8/1/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

/// Communication with Canvases
protocol CanvasServiceProtocol {
    var canvas: Canvas { get }
    
    func saveShapeView(_ shapeView: Canvas.ShapeView)
}
