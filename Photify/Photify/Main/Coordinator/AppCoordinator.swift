//
//  ApplicationCoordinator.swift
//  Photify
//
//  Created by Galushka on 7/9/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: Properties(Private)
    
    private let window: UIWindow
    private let launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    private let appAssembler: AppAssemblerType
    private let modulesAssembler: ModulesBuilder
    private let navigationController: UINavigationController
    private let router: PushRouter
    
    private var modules = [ViewControllerBasedModule]()
    
    // MARK: - Initializers
    
    init(window: UIWindow,
         navigationController: UINavigationController = UINavigationController(),
         launchOptions: [UIApplication.LaunchOptionsKey: Any]?,
         appAssembler: AppAssemblerType) {
        self.window = window
        self.navigationController = navigationController
        self.router = Router(navigationController: navigationController)
        self.launchOptions = launchOptions
        self.appAssembler = appAssembler
        self.modulesAssembler = ModulesAssembler(appAssembler: appAssembler)
    }
    
    // MARK: - Coordinator Imp
    
    func start() {
        let initialModule = self.makeIntialModule()
        
        self.addModule(initialModule)
        
        let settings = Router.Settings(animated: false,
                                       willPopHandler: nil) { [weak self] in
                                        self?.removeModule(initialModule)
        }
        
        self.router.setRootModule(initialModule, settings: settings)
        window.rootViewController = self.navigationController
    }
    
    // MARK: - Modules Management
    
    private func addModule(_ module: ViewControllerBasedModule) {
        modules.append(module)
    }
    
    private func addModules(_ modules: [ViewControllerBasedModule]) {
        self.modules.append(contentsOf: modules)
    }
    
    private func removeModule(_ module: ViewControllerBasedModule) {
        modules.removeAll { $0 === module }
    }
    
    // MARK: - Methods(Private)
    
    private func makeIntialModule() -> ViewControllerBasedModule {
        let module = modulesAssembler.assembleCanvasListModule()
        module.output = self
        
        return module
    }
}

extension AppCoordinator: CanvasListModuleOutput {
    
    func didTapOnCanvas(_ canvas: Canvas) {
        let canvasModule = modulesAssembler.assembleCanvasModule()
        
        self.addModule(canvasModule)
        
        let settings = Router.Settings(animated: true, willPopHandler: nil) { [weak self] in
            self?.removeModule(canvasModule)
        }
        
        self.router.push(module: canvasModule, settings: settings)
    }
}
