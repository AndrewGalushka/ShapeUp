//
//  CanvasPresenterProtocol.swift
//  Photify
//
//  Created by Galushka on 7/23/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation
import CoreGraphics.CGGeometry

protocol CanvasPresenterProtocol: AnyObject {
    func viewLoaded()
    func handleShapeDrop(atLocation center: CGPoint, size: CGSize, color: Color)
}
