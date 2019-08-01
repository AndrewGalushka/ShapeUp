//
//  CanvasStorable.swift
//  Database
//
//  Created by Galushka on 7/31/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

public protocol CanvasStorable {
    var identifier: UUID { get }
    var name: String { get }
    
    init(identifier: UUID, name: String)
}
