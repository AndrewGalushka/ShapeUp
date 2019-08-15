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
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let appAssembler = (UIApplication.shared.delegate as! AppDelegate).appAssembler
        let window = UIWindow(windowScene: windowScene)
        let appCoordinator = AppCoordinator(window: window,
                                            launchOptions: nil,
                                            appAssembler: appAssembler)
        self.window = window
        self.appCoordinator = appCoordinator
        
//        let startTime = Date()
//        appAssembler.loadInternalData()
//        print("AppAssembler load time is: \(Date().timeIntervalSince1970 - startTime.timeIntervalSince1970)")
        
        self.appCoordinator?.start()
        self.window?.makeKeyAndVisible()
    }
    
    private func makeInitialViewController() -> UIViewController {
        let initialVC = UIViewController()
        initialVC.view.backgroundColor = .red
        return initialVC
    }
}
