//
//  AppAssemblerFactory.swift
//  Photify
//
//  Created by Galushka on 9/13/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

enum AppAssemblerFactory {
    static func makeDefault() -> AppAssemblerType {
        return AppAssembler()
    }
}
