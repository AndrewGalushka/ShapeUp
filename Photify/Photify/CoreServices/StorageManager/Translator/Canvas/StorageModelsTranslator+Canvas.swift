//
//  StorageModelsTranslator+Canvas.swift
//  Photify
//
//  Created by Galushka on 8/5/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation
import DataStorage

extension StorageModelsTranslator: CanvasMapable {
    func translate(canvas: Canvas) -> CanvasDTO {
        return CanvasDTO(identifier: canvas.identifier, name: canvas.name)
    }
    
    func translate(canvasDTO: CanvasDTO) -> Canvas {
        return Canvas(identifier: canvasDTO.identifier,
                      name: canvasDTO.name,
                      shapes: self.translate(shapeViewsDTOs: canvasDTO.shapes))
    }
}
