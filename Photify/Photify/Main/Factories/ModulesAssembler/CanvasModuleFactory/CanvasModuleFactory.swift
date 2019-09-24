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
        let interactor = makeInteractor(canvas: canvas)
        let presenter = CanvasPresenter(interactor: interactor)
        let view = CanvasViewController.loadFromStoryboard()
        
        configureCommunication(betweenInteractor: interactor, presenter: presenter, view: view)
        
        let canvasModule = CanvasModule(interactor: interactor,
                                        presenter: presenter,
                                        view: view)
        presenter.output = canvasModule
        
        return canvasModule
    }
    
    private func makeInteractor(canvas: Canvas) -> CanvasInteractor {
        let service = appAssembler.assembleCanvasService(canvas: canvas)
        return CanvasInteractor(canvasService: service)
    }
    
    private func configureCommunication(betweenInteractor interactor: CanvasInteractor, presenter: CanvasPresenter, view: CanvasViewController) {
        interactor.output = presenter
        presenter.view = view
        view.presenter = presenter
    }
}
