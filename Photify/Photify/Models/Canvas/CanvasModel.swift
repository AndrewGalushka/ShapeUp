//
//  CanvasModel.swift
//  Photify
//
//  Created by Galushka on 7/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

struct CanvasModel: Canvas {
    let identifier: UUID
    let name: String
    
    init(name: String) {
        self.name = name
        self.identifier = UUID()
    }
    
    init(identifier: UUID, name: String) {
        self.identifier = identifier
        self.name = name
    }
}
