//
//  AppDelegateFactory.swift
//  Photify
//
//  Created by Galushka on 9/13/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

enum AppDelegatesFactory {
    static func makeDefault() -> AppDelegateType {
        return CompositeAppDelegate(appDelegates:
            [StartupConfiguratorAppDelegate(),
             ScenesSessionAppDelegate()]
        )
    }
}
