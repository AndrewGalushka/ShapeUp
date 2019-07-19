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
    
    private let storageManager: StorageManagerType
    
    // MARK: - Properties(Public)
    
    weak var output: CanvasesListPresenterOutput?
    weak var view: CanvasListView?
    
    var savedCanvases: [Canvas] = [Canvas]()
    var newCanvases: [Canvas] = [Canvas]()
    var canvases: [Canvas] {
        return savedCanvases + newCanvases
    }
    
    // MARK: - Initializers
    
    init(storageManager: StorageManagerType) {
        self.storageManager = storageManager
    }
    
    // MARK: - CanvasesListPresenterProtocol imp
    
    func viewLoaded() {
        self.fetchCanvases()
        self.view?.displayCanvases(canvases)
    }
    
    func addCanvasPressed(name: String) {
        let canvas = CanvasModel(name: name)
        newCanvases.append(canvas)
        self.view?.displayCanvases(canvases)
    }
    
    func didTapSaveCanvases() {
        guard !self.canvases.isEmpty else { return }
        
        self.storageManager.saveCanvases(self.newCanvases)
        savedCanvases.append(contentsOf: newCanvases)
        self.newCanvases.removeAll()
    }
    
    func didTapOnCanvas(_ canvas: Canvas) {
    }
    
    // MARK: - Methods(Private)
    
    private func fetchCanvases() {
        let fetchedCanvases = storageManager.fetchAllCanvases()
        self.savedCanvases = fetchedCanvases
    }
}
