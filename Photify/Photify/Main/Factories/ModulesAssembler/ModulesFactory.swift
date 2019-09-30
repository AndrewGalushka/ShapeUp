//
//  ModulesFactory.swift
//  Photify
//
//  Created by Galushka on 7/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol ModulesFactory {
    func assembleCanvasListModule() -> CanvasListAssembly
    func makeCanvasModuleFactory() -> CanvasModuleAbstractFactory
}
