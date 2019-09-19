//
//  SceneDelegate.swift
//  Photify
//
//  Created by Galushka on 8/15/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    lazy var appAssembler: AppAssemblerType = AppAssemblerFactory.makeDefault()
    
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        initializeUIStack(scene, options: connectionOptions, appAssembler: self.appAssembler)
    }
    
    @available(iOS 13.0, *)
    func initializeUIStack(_ scene: UIScene, options connectionOptions: UIScene.ConnectionOptions, appAssembler: AppAssemblerType) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let appCoordinator = AppCoordinator(window: window,
                                            launchOptions: nil,
                                            appAssembler: appAssembler)
        self.window = window
        self.appCoordinator = appCoordinator
        
        self.appCoordinator?.start()
        self.window?.makeKeyAndVisible()
        
        return
    }
}
