//
//  CanvasService.swift
//  Photify
//
//  Created by Galushka on 8/1/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

class CanvasService: CanvasServiceProtocol {
    let canvas: Canvas
    private let shapeStorage: CanvasShapeViewStorable
    
    init(canvas: Canvas, shapeStorage: CanvasShapeViewStorable) {
        self.canvas = canvas
        self.shapeStorage = shapeStorage
    }
    
    func saveShapeView(_ shapeView: Canvas.ShapeView) {
        self.shapeStorage.addShapeView(shapeView, in: canvas)
    }
}
