//
//  AppAssembler.swift
//  Photify
//
//  Created by Galushka on 7/10/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

class AppAssembler: AppAssemblerType {
    private(set) var isLoaded: Bool = false
    private lazy var storageManager: StorageManageable = StorageManager.loadStorage()

    func loadInternalData() {
        _ = storageManager
        self.isLoaded = true
    }
    
    func assembleStorageManager() -> StorageManageable {
        if !isLoaded {
            loadInternalData()
        }
        
        return storageManager
    }
    
    func assembleCanvasService(canvas: Canvas) -> CanvasServiceProtocol {
        return CanvasService(canvas: canvas, shapeStorage: storageManager)
    }
}
