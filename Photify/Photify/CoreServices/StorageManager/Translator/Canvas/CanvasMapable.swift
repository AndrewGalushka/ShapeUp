//
//  CanvasMapable.swift
//  Photify
//
//  Created by Galushka on 8/7/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import DataStorage

protocol CanvasMapable {
    func translate(canvas: Canvas) -> CanvasDTO
    func translate(canvasDTO: CanvasDTO) -> Canvas
    
    func translate(canvases: [Canvas]) -> [CanvasDTO]
    func translate(canvasesDTOs: [CanvasDTO]) -> [Canvas]
}

extension CanvasMapable {
    func translate(canvases: [Canvas]) -> [CanvasDTO] {
        return canvases.map {
            self.translate(canvas: $0)
        }
    }
    
    func translate(canvasesDTOs: [CanvasDTO]) -> [Canvas] {
        return canvasesDTOs.map {
            self.translate(canvasDTO: $0)
        }
    }
}
