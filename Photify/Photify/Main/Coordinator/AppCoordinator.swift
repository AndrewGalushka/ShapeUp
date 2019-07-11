//
//  ApplicationCoordinator.swift
//  Photify
//
//  Created by Galushka on 7/9/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    private let window: UIWindow
    private let launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    private let appAssembler: AppAssemblerType
    private let navigationController: UINavigationController
    
    init(window: UIWindow,
         navigationController: UINavigationController = UINavigationController(),
         launchOptions: [UIApplication.LaunchOptionsKey: Any]?,
         appAssembler: AppAssemblerType) {
        self.window = window
        self.navigationController = navigationController
        self.launchOptions = launchOptions
        self.appAssembler = appAssembler
    }
    
    func start() {
        let mainScreenVC = MainScreenViewController.loadFromStoryboard()
        self.navigationController.setViewControllers([mainScreenVC], animated: false)
        window.rootViewController = self.navigationController
    }
}
