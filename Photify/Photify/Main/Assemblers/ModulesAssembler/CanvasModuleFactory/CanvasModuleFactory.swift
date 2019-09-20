//
//  CanvasModuleFactory.swift
//  Photify
//
//  Created by Galushka on 9/20/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

class CanvasModuleFactory: CanvasModuleAbstractFactory {
    
    // MARK: Properties(Private)
    
    private let appAssembler: AppAssemblerType
    
    // MARK: Initializers
    
    init(appAssembler: AppAssemblerType) {
        self.appAssembler = appAssembler
    }
    
    func makeCanvasModule(canvas: Canvas) -> CanvasModuleType {
        let canvasService = appAssembler.assembleCanvasService(canvas: canvas)
        let canvasView = CanvasViewController.loadFromStoryboard()
        let canvasPresenter = CanvasPresenter(canvasService: canvasService)
        
        let canvasModule = CanvasModule(view: canvasView,
                                        presenter: canvasPresenter)
        
        return canvasModule
    }
}
