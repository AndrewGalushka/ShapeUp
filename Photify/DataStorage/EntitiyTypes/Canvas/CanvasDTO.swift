//
//  CanvasDTO.swift
//  DataStorage
//
//  Created by Galushka on 8/2/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

public struct CanvasDTO {
    public var identifier: UUID
    public var name: String
    
    public init(identifier: UUID, name: String) {
        self.identifier = identifier
        self.name = name
    }
}
