//
//  ModulesAssembler.swift
//  Photify
//
//  Created by Galushka on 7/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

class ModulesAssembler: ModulesBuilder {
    private let appAssembler: AppAssemblerType
    
    init(appAssembler: AppAssemblerType) {
        self.appAssembler = appAssembler
    }
    
    func assembleCanvasListModule() -> CanvasListModule {
        let storageManager = appAssembler.assembleStorageManager()
        
        let canvasListView = CanvasListViewController.loadFromStoryboard()
        let canvasesListPresenter = CanvasesListPresenter(storageManager: storageManager)
        
        let module = CanvasListModule(view: canvasListView,
                                      presenter: canvasesListPresenter)
        
        return module
    }
}
