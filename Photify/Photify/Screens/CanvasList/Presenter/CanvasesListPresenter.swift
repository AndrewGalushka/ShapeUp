//
//  CanvasesListPresenter.swift
//  Photify
//
//  Created by Galushka on 7/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

class CanvasesListPresenter: CanvasesListPresenterProtocol {
    
    // MARK: - Propeties(Private)
    
    private let canvasListManagemetService: CanvasListManagementServiceProtocol
    
    // MARK: - Properties(Public)
    
    weak var output: CanvasesListPresenterOutput?
    weak var view: CanvasListView?
    
    // MARK: - Initializers
    
    init(storageManager: StorageManagerType) {
        self.canvasListManagemetService = CanvasListManagementService(storageManager: storageManager)
    }
    
    // MARK: - CanvasesListPresenterProtocol imp
    
    func viewLoaded() {
        let canvases = self.canvasListManagemetService.fetchAllCanvases()
        self.view?.displayCanvases(canvases)
    }
    
    func addCanvasPressed(name: String) {
        canvasListManagemetService.addCanvas(name: name)
        self.view?.displayCanvases(canvasListManagemetService.canvases)
    }
    
    func removeCanvasPressed(canavas canvasToDelete: Canvas) {
        canvasListManagemetService.deleteCanvas(canvasToDelete)
        self.view?.displayCanvases(canvasListManagemetService.canvases)
    }
    
    func didTapSaveCanvases() {
        self.canvasListManagemetService.saveChanges()
    }
    
    func didTapOnCanvas(_ canvas: Canvas) {
        self.output?.didTapOnCanvas(canvas)
    }
}
