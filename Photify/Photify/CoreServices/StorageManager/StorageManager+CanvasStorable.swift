//
//  StorageManager+CanvasStorable.swift
//  Photify
//
//  Created by Galushka on 8/7/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

extension StorageManager: CanvasStorable {
    
    func fetchCanvasBy(ID: UUID) -> Canvas? {
        guard let fetchedCanvas = dataStorage.fetchCanvasBy(ID: ID) else {
            return nil
        }
        
        let canvas = translator.translate(canvasDTO: fetchedCanvas)
        return canvas
    }
    
    func saveCanvases(_ canvases: [Canvas]) {
        let canvasesDTOs = translator.translate(canvases: canvases)
        dataStorage.saveCanvases(canvasesDTOs)
    }
    
    func fetchAllCanvases() -> [Canvas] {
        let results = dataStorage.fetchAllCanvases()
        return translator.translate(canvasesDTOs: results)
    }
    
    func deleteCanvases(_ canvases: [Canvas]) {
        self.dataStorage.deleteCanvases(identifiers: canvases.map { $0.identifier })
    }
}
