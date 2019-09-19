//
//  ScenesSessionAppDelegate.swift
//  Photify
//
//  Created by Galushka on 9/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class ScenesSessionAppDelegate: AppDelegateType {
    
    @available(iOS 13, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let configName = configurationName(for: connectingSceneSession, options: options)
        let sceneConfiguration = UISceneConfiguration(name: configName,
                                                      sessionRole: connectingSceneSession.role)
        sceneConfiguration.delegateClass = SceneDelegate.self
        
        return sceneConfiguration
    }
    
    @available(iOS 13, *)
    private func configurationName(for scene: UISceneSession, options: UIScene.ConnectionOptions) -> String? {
        return "Default Configuration"
    }
}
