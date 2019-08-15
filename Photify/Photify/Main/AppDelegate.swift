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

    var window: UIWindow?
    private(set) lazy var appAssembler: AppAssembler = {
        return AppAssembler()
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        /*
         Note: If your application adopts new Scene Lifecycle,
            this method should not setup UI things.
            Good example of using this method is to share Assembler whose internal DataStorage instance is shared
        */
        
        let startTime = Date()
        self.appAssembler.loadInternalData()
        print("AppAssembler load time is: \(Date().timeIntervalSince1970 - startTime.timeIntervalSince1970)")
        
//        let window = UIWindow(frame: UIScreen.main.bounds)
//        let appCoordinator = AppCoordinator(window: window,
//                                            launchOptions: launchOptions,
//                                            appAssembler: appAssembler)
//        self.window = window
//        self.appCoordinator = appCoordinator
//

//
//        self.appCoordinator?.start()
//        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let sceneConfigurations = UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        sceneConfigurations.delegateClass = SceneDelegate.self
        
        return sceneConfigurations
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        super.restoreUserActivityState(activity)
        
    }
}

