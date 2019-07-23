//
//  ModulesAssembler.swift
//  Photify
//
//  Created by Galushka on 7/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

class ModulesAssembler: ModulesBuilder {
    
    // MARK: Properties(Private)
    
    private let appAssembler: AppAssemblerType
    
    // MARK: Initializers
    
    init(appAssembler: AppAssemblerType) {
        self.appAssembler = appAssembler
    }
    
    // MARK: - ModulesBuilder imp
    
    func assembleCanvasListModule() -> CanvasListModule {
        let storageManager = appAssembler.assembleStorageManager()
        
        let canvasListView = CanvasListViewController.loadFromStoryboard()
        let canvasesListPresenter = CanvasesListPresenter(storageManager: storageManager)
        
        let module = CanvasListModule(view: canvasListView,
                                      presenter: canvasesListPresenter)
        
        return module
    }
    
    func assembleCanvasModule() -> CanvasModule {
        let canvasView = CanvasViewController.loadFromStoryboard()
        let canvasPresenter = CanvasPresenter()
        
        let canvasModule = CanvasModule(view: canvasView,
                                  presenter: canvasPresenter)
        
        return canvasModule
    }
}
