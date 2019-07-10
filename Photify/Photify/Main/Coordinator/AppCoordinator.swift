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
    
    init(window: UIWindow,
         launchOptions: [UIApplication.LaunchOptionsKey: Any]?,
         appAssembler: AppAssemblerType = AppAssembler()) {
        self.window = window
        self.launchOptions = launchOptions
        self.appAssembler = appAssembler
    }
    
    func start() {
        window.rootViewController = ShapesContextViewController.loadFromStoryboard()
    }
}
