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
    private var canvasInteractorRouters = NSMapTable<AnyObject, CanvasInteractionMediator>.strongToWeakObjects()
    
    // MARK: Initializers
    
    init(appAssembler: AppAssemblerType) {
        self.appAssembler = appAssembler
    }
    
    func makeCanvasModule(canvas: Canvas) -> AssemblyType {
        let interactor = makeInteractor(canvas: canvas)
        let presenter = CanvasPresenter(interactor: interactor)
        let view = CanvasViewController.loadFromStoryboard()
        
        configureCommunication(betweenInteractor: interactor, presenter: presenter, view: view)
        
        let canvasModule = CanvasAssembly(interactor: interactor,
                                        presenter: presenter,
                                        view: view)
        presenter.output = canvasModule
        
        return canvasModule
    }
    
    private func makeInteractor(canvas: Canvas) -> CanvasInteractionMediator {
        let interactorRouter: CanvasInteractionMediator
        
        if let sharedInteractorRouter = canvasInteractorRouters.object(forKey: canvas.identifier as AnyObject) {
            interactorRouter = sharedInteractorRouter
        } else {
            let service = appAssembler.assembleCanvasService(canvas: canvas)
            let interactor = CanvasInteractor(canvasService: service)
            interactorRouter = CanvasInteractionMediator(canvasID: canvas.identifier, interactor: interactor)
            
            self.canvasInteractorRouters.setObject(interactorRouter, forKey: canvas.identifier as AnyObject)
        }
        
        return interactorRouter
    }
    
    private func configureCommunication(betweenInteractor interactor: CanvasInteractionMediator, presenter: CanvasPresenter, view: CanvasViewController) {
        interactor.addPresenter(presenter)
        presenter.view = view
        view.presenter = presenter
    }
}
