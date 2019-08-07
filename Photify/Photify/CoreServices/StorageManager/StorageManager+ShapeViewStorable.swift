//
//  StorageManager+ShapeViewStorable.swift
//  Photify
//
//  Created by Galushka on 8/7/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

extension StorageManager: CanvasShapeViewStorable {
    func fetchCanvasBy(ID: UUID) {
        #warning("Need to add real implementation")
        fatalError()
    }
    
    func addShapeView(_ shapeView: Canvas.ShapeView, in canvas: Canvas) -> Canvas? {
        let shapeViewDTO = translator.translate(shapeView: shapeView)
        let canvasDTO = translator.translate(canvas: canvas)
        
        #warning("Need to add real implementation")
        fatalError()
    }
}
