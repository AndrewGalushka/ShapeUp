//
//  CanvasType.swift
//  Photify
//
//  Created by Galushka on 7/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol Canvas {
    var identifier: UUID { get }
    var name: String { get }
}
