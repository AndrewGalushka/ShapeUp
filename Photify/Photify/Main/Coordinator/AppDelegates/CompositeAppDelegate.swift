//
//  CompositeAppDelegate.swift
//  Photify
//
//  Created by Galushka on 9/13/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

typealias AppDelegateType = UIResponder & UIApplicationDelegate

class CompositeAppDelegate: AppDelegateType {
    private let appDelegates: [AppDelegateType]
    
    init(appDelegates: [AppDelegateType]) {
        self.appDelegates = appDelegates
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return appDelegates.reduce(true) {
            return $0 && ($1.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? true)
        }
    }
}
