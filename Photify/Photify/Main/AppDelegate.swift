//
//  AppDelegate.swift
//  Photify
//
//  Created by Galushka on 7/8/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let appDelegate = AppDelegatesFactory.makeDefault()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        _ = appDelegate.application?(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        guard let sceneConfiguration = appDelegate.application?(application, configurationForConnecting: connectingSceneSession, options: options) else {
            fatalError("Implement \(#selector(application(_:configurationForConnecting:options:))) in leaf AppDelegate or if you don't support Scenes remove this method from AppDelegate")
        }
        return sceneConfiguration
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        appDelegate.application?(application, didDiscardSceneSessions: sceneSessions)
    }
}

