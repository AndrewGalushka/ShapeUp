//
//  Router.swift
//  Photify
//
//  Created by Galushka on 7/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit


class Router: NSObject, PushRouter {
    
    // MARK: Properties(Public)
    
    let navigationController: UINavigationController
    
    // MARK: Properties(Private)
    
    private var modulesSettings = [UIViewController: PushSettings]()
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        super.init()
        
        navigationController.delegate = self
    }
    
    // MARK: - PushRouter imp
    
    func push(module: ViewControllerBasedModule, settings: PushSettings?) {
        self.register(setting: settings, for: module.asViewController)
        
        self.navigationController.pushViewController(module.asViewController,
                                                     animated: settings?.animated ?? true)
    }
    
    func setRootModule(_ module: ViewControllerBasedModule, settings: PushSettings?) {
        self.willChangeRootModule()
        self.navigationController.setViewControllers([module.asViewController], animated: settings?.animated ?? true)
        self.didChangeRootModule()
        
        self.register(setting: settings, for: module.asViewController)
    }
    
    // MARK: - Methods(Private)
    
    private func register(setting: PushSettings?, for viewController: UIViewController) {
        guard let setting = setting else { return }

        modulesSettings[viewController] = setting
    }
    
    private func unregisterSettings(for viewController: UIViewController) {
        modulesSettings[viewController] = nil
    }
    
    private func willChangeRootModule() {
        
        for vc in Array(modulesSettings.keys) { //where navigationController.contains(vc) {
            self.modulesSettings[vc]?.willPopHandler?()
        }
    }
    
    private func didChangeRootModule() {
        for vc in Array(modulesSettings.keys) {
            self.modulesSettings[vc]?.didPopHandler?()
        }
        
        modulesSettings.removeAll()
    }
}

extension Router: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        guard
            let poppedVC = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(poppedVC)
        else {
            return
        }
        
        if let settings = modulesSettings[poppedVC] {
            settings.willPopHandler?()
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard
            let poppedVC = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(poppedVC)
        else {
            return
        }
        
        if let settings = modulesSettings[poppedVC] {
            settings.didPopHandler?()
            unregisterSettings(for: poppedVC)
        }
    }
}

extension Router {
    struct Settings: PushSettings {
        let animated: Bool
        let didPopHandler: DidPopHandler?
        let willPopHandler: WillPopHandler?
        
        init(animated: Bool = true, willPopHandler: WillPopHandler? = nil, didPopHandler: DidPopHandler? = nil) {
            self.animated = animated
            self.willPopHandler = willPopHandler
            self.didPopHandler = didPopHandler
        }
    }
}
