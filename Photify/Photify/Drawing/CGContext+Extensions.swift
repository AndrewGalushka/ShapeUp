//
//  CGContext+Extensions.swift
//  Photify
//
//  Created by Galushka on 8/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import QuartzCore

extension CGContext {
    func drawAction(_ drawAction: () -> Void ) {
        saveGState()
        drawAction()
        restoreGState()
    }
}
