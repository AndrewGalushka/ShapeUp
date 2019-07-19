//
//  PushRouter.swift
//  Photify
//
//  Created by Galushka on 7/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol PushSettings {
    typealias WillPopHandler = () -> Void
    typealias DidPopHandler = () -> Void

    var animated: Bool { get }
    var willPopHandler: WillPopHandler? { get }
    var didPopHandler: DidPopHandler? { get }
}

protocol PushRouter {
    func push(module: ViewControllerBasedModule, settings: PushSettings?)
    func setRootModule(_ module: ViewControllerBasedModule, settings: PushSettings?)
}
