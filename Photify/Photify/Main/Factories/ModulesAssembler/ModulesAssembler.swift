//
//  ModulesAssembler.swift
//  Photify
//
//  Created by Galushka on 7/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

class ModulesAssembler: ModulesFactory {
    
    // MARK: Properties(Private)
    
    private let appAssembler: AppAssemblerType
    private static var sharedCanvasFactory: CanvasModuleAbstractFactory!
    
    // MARK: Initializers
    
    init(appAssembler: AppAssemblerType) {
        self.appAssembler = appAssembler
    }
    
    // MARK: - ModulesBuilder imp
    
    func assembleCanvasListModule() -> CanvasListAssembly {
        let storageManager = appAssembler.assembleStorageManager()
        
        let canvasListView = CanvasListViewController.loadFromStoryboard()
        let canvasesListPresenter = CanvasesListPresenter(storageManager: storageManager)
        
        let module = CanvasListAssembly(view: canvasListView,
                                      presenter: canvasesListPresenter)
        
        return module
    }
    
    func makeCanvasModuleFactory() -> CanvasModuleAbstractFactory {
        
        if Self.sharedCanvasFactory == nil {
            Self.sharedCanvasFactory = CanvasModuleFactory(appAssembler: appAssembler)
        }
        
        return Self.sharedCanvasFactory
    }
}
