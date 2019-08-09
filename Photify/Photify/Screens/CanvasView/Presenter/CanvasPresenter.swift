//
//  CanvasPresenter.swift
//  Photify
//
//  Created by Galushka on 7/23/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

class CanvasPresenter: CanvasPresenterProtocol {
    
    // MARK: Properties(Private)
    
    private let canvasService: CanvasServiceProtocol
    
    // MARK: Properties(Public)
    
    weak var view: CanvasView?
    weak var output: CanvasPresenterOutput?
    
    // MARK: Initializers
    
    init(canvasService: CanvasServiceProtocol) {
        self.canvasService = canvasService
    }
    
    // MARK: - CanvasPresenterProtocol Imp
    
    func viewLoaded() {
        self.view?.setTitleText(to: canvasService.canvas.name)
        self.view?.displayShapes(canvasService.canvas.shapes)
    }
}
