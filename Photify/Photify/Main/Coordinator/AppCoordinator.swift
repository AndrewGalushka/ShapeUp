//
//  ApplicationCoordinator.swift
//  Photify
//
//  Created by Galushka on 7/9/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    private let launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    
    init(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        self.launchOptions = launchOptions
    }
    
    func start() {
    }
}
