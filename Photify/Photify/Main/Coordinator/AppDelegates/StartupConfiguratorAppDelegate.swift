//
//  StartupConfiguratorAppDelegate.swift
//  Photify
//
//  Created by Galushka on 9/13/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class StartupConfiguratorAppDelegate: AppDelegateType {
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    lazy var appAssembler: AppAssemblerType = Self.loadAppAssembler()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let appAssembler = self.appAssembler
        initializeUIStack(launchOptions: launchOptions, appAssembler: appAssembler)
        
        return true
    }
    
    static func loadAppAssembler() -> AppAssemblerType {
        let startTime = Date()
        let appAssembler = AppAssemblerFactory.makeDefault()
        appAssembler.loadInternalData()
        debugPrint("AppAssembler load time is: \(Date().timeIntervalSince1970 - startTime.timeIntervalSince1970)")
        
        return appAssembler
    }

    func initializeUIStack(launchOptions: [UIApplication.LaunchOptionsKey: Any]?, appAssembler: AppAssemblerType) {
        
        guard #available(iOS 13, *) else {
            let window = UIWindow(frame: UIScreen.main.bounds)
            let appCoordinator = AppCoordinator(window: window,
                                                launchOptions: launchOptions,
                                                appAssembler: appAssembler)
            self.window = window
            self.appCoordinator = appCoordinator
            
            self.appCoordinator?.start()
            self.window?.makeKeyAndVisible()
            
            return
        }
    }
}

