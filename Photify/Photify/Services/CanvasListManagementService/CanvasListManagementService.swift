//
//  CanvasListManagementService.swift
//  Photify
//
//  Created by Galushka on 7/22/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

class CanvasListManagementService: CanvasListManagementServiceProtocol {
    
    // MARK: - Properties(Private)
    
    private let storageManager: StorageManagerType
    
    private var fetchedCanvases: [Canvas] = [Canvas]()
    private var pendingCanvasesToSave: [Canvas] = [Canvas]()
    private var pendingCanvasesToDelete: [Canvas] = [Canvas]()
    
    // MARK: - Properties(Public)
    
    var canvases: [Canvas] {
        return currentCanvasList()
    }
    
    // MARK: Initializers
    
    init(storageManager: StorageManagerType) {
        self.storageManager = storageManager
    }
    
    // MARK: CanvasListManagementServiceProtocol imp
    
    func fetchAllCanvases() -> [Canvas] {
        let fetchedCanvases = storageManager.fetchAllCanvases()
        self.fetchedCanvases = fetchedCanvases
        
        return self.currentCanvasList()
    }
    
    func addCanvas(name: String) {
        let canvas = Canvas(identifier: UUID(), name: name, shapes: [])
        self.pendingCanvasesToSave.append(canvas)
    }
    
    func deleteCanvas(_ canvas: Canvas) {
        
        if pendingCanvasesToSave.contains(where: { canvas.identifier == $0.identifier }) {
            pendingCanvasesToSave.removeAll(where: { $0.identifier == canvas.identifier })
        } else if self.fetchedCanvases.contains(where: { canvas.identifier == $0.identifier }) {
            self.fetchedCanvases.removeAll(where: { $0.identifier == canvas.identifier })
            self.pendingCanvasesToDelete.append(canvas)
        }
    }
    
    func saveChanges() {
        
        if !self.pendingCanvasesToSave.isEmpty {
            self.storageManager.saveCanvases(pendingCanvasesToSave)
            
            self.fetchedCanvases.append(contentsOf: pendingCanvasesToSave)
            self.pendingCanvasesToSave.removeAll()
        }
        
        if !self.pendingCanvasesToDelete.isEmpty {
            self.storageManager.deleteCanvases(pendingCanvasesToDelete)
            self.pendingCanvasesToDelete.removeAll()
        }
    }
    
    // MARK: Methods(Private)
    
    private func currentCanvasList() -> [Canvas] {
        
        let currentList = (fetchedCanvases + pendingCanvasesToSave).filter { canvas in
            let isCanvasDeleted = self.pendingCanvasesToDelete.contains {
                $0.identifier == canvas.identifier
            }
            
            return !isCanvasDeleted
        }
        
        return currentList
    }
    
    private func hasChanges() -> Bool {
        let isCanvasListHasChanges = !self.pendingCanvasesToDelete.isEmpty || !self.pendingCanvasesToSave.isEmpty
        return isCanvasListHasChanges
    }
}
