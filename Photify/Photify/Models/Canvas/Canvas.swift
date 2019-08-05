//
//  CanvasType.swift
//  Photify
//
//  Created by Galushka on 7/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

struct Canvas {
    let identifier: UUID
    let name: String
    
    init(identifier: UUID, name: String) {
        self.identifier = identifier
        self.name = name
    }
}
