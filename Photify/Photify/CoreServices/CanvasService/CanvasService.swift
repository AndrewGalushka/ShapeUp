//
//  CanvasService.swift
//  Photify
//
//  Created by Galushka on 8/1/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

class CanvasService: CanvasServiceProtocol {
    private(set) var canvas: Canvas
    private let shapeStorage: CanvasShapeViewStorable & CanvasStorable
    
    init(canvas: Canvas, shapeStorage: CanvasShapeViewStorable & CanvasStorable) {
        self.canvas = canvas
        self.shapeStorage = shapeStorage
    }
    
    func refresh() {
        if let refreshedCanvas = shapeStorage.fetchCanvasBy(ID: canvas.identifier) {
            self.canvas = refreshedCanvas
        }
    }
    
    func saveShapeView(_ shapeView: Canvas.ShapeView) {
        self.shapeStorage.addShapeView(shapeView, in: canvas)
    }
}
