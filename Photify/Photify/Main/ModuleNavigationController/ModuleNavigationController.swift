//
//  ModuleNavigationController.swift
//  Photify
//
//  Created by Galushka on 7/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class ModuleNavigationController: NSObject {
    
    // MARK: Properties(Public)
    
    let uiNavigationController: UINavigationController
    
    // MARK: Properties(Private)
    
    private let settingsController = SettingsController()
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.uiNavigationController = navigationController
        
        super.init()
        
        navigationController.delegate = self
    }
        
    func push(module: ViewControllerBasedModule, settings: Settings?) {
        if let settings = settings { settingsController.register(settings, for: module.asViewController) }
        
        self.uiNavigationController.pushViewController(module.asViewController,
                                                       animated: settings?.animated ?? true)
    }
    
    func setRootModule(_ module: ViewControllerBasedModule, settings: Settings?) {
        self.willChangeRootModule()
        self.uiNavigationController.setViewControllers([module.asViewController], animated: settings?.animated ?? true)
        self.didChangeRootModule()
        
        if let settings = settings {
            settingsController.register(settings, for: module.asViewController)
        }
    }
    
    // MARK: - Methods(Private)
    
    private func willChangeRootModule() {
        self.settingsController.fireAllWillPopHandlers()
    }
    
    private func didChangeRootModule() {
        self.settingsController.fireAllDidPopHandlers()
        settingsController.removeAllSettings()
    }
}

extension ModuleNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        guard
            let poppedVC = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(poppedVC)
        else {
            return
        }
        
        self.settingsController.fireWillPopHandler(for: poppedVC)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard
            let poppedVC = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(poppedVC)
        else {
            return
        }
        
        settingsController.fireDidPopHandler(for: poppedVC)
        settingsController.removeSettings(for: poppedVC)
    }
}

extension ModuleNavigationController {
    
    private class SettingsController {
        private var modulesSettings = [UIViewController: Settings]()
        
        func register(_ settings: Settings, for viewController: UIViewController) {
            modulesSettings[viewController] = settings
        }
        
        func removeSettings(for viewController: UIViewController) {
            modulesSettings[viewController] = nil
        }
        
        func fireWillPopHandler(for viewController: UIViewController) {
            modulesSettings[viewController]?.willPopHandler?()
        }
        
        func fireDidPopHandler(for viewController: UIViewController) {
            modulesSettings[viewController]?.didPopHandler?()
        }
        
        func fireAllDidPopHandlers() {
            modulesSettings.values.forEach { $0.didPopHandler?() }
        }
        
        func fireAllWillPopHandlers() {
            modulesSettings.values.forEach { $0.willPopHandler?() }
        }
        
        func removeAllSettings() {
            modulesSettings.removeAll()
        }
    }
    
    struct Settings {
        typealias DidPopHandler = () -> Void
        typealias WillPopHandler = () -> Void
        
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
