//
//  StartupDelegate.swift
//  Photify
//
//  Created by Galushka on 9/13/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class StartupAppDelegate: AppDelegateType {
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let appAssembler = AppAssembler()
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = AppCoordinator(window: window,
                                            launchOptions: launchOptions,
                                            appAssembler: appAssembler)
        self.window = window
        self.appCoordinator = appCoordinator
        
        let startTime = Date()
        appAssembler.loadInternalData()
        debugPrint("AppAssembler load time is: \(Date().timeIntervalSince1970 - startTime.timeIntervalSince1970)")
        
        self.appCoordinator?.start()
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
