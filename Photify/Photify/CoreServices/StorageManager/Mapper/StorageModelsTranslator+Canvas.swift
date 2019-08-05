//
//  StorageModelsTranslator+Canvas.swift
//  Photify
//
//  Created by Galushka on 8/5/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation
import DataStorage

extension StorageModelsTranslator {
    func translate(canvas: Canvas) -> CanvasDTO {
        let dto = self.translate(canvases: [canvas])[0]
        
        return dto
    }
    
    func translate(canvasDTO: CanvasDTO) -> Canvas {
        let canvas = self.translate(canvasDTOs: [canvasDTO])[0]
        
        return canvas
    }
    
    func translate(canvases: [Canvas]) -> [CanvasDTO] {
        let dtos = canvases.map {
            return CanvasDTO(identifier: $0.identifier,
                             name: $0.name)
        }
        
        return dtos
    }
    
    func translate(canvasDTOs: [CanvasDTO]) -> [Canvas] {
        let canvases = canvasDTOs.map {
            return Canvas(identifier: $0.identifier,
                          name: $0.name)
        }
        
        return canvases
    }
}
