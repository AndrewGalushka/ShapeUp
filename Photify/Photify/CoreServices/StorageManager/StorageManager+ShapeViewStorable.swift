//
//  StorageManager+ShapeViewStorable.swift
//  Photify
//
//  Created by Galushka on 8/7/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

extension StorageManager: CanvasShapeViewStorable {
    func addShapeView(_ shapeView: Canvas.ShapeView, in canvas: Canvas) -> Canvas? {
        return self.addShapeView([shapeView], in: canvas)
    }
    
    func addShapeView(_ shapeViews: [Canvas.ShapeView], in canvas: Canvas) -> Canvas? {
        let shapeViewDTOs = translator.translate(shapeViews: shapeViews)
        let canvasDTO = translator.translate(canvas: canvas)
        
        guard let updatedCanvasDTO = self.dataStorage.addShapeViews(shapeViewDTOs, to: canvasDTO) else {
            return nil
        }
        
        return translator.translate(canvasDTO: updatedCanvasDTO)
    }
}
