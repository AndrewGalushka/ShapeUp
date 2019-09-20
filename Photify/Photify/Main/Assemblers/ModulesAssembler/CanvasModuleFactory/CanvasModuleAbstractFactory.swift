//
//  CanvasModuleAbstractFactory.swift
//  Photify
//
//  Created by Galushka on 9/20/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol CanvasModuleAbstractFactory: AnyObject {
    func makeCanvasModule(canvas: Canvas) -> CanvasModuleType
}
