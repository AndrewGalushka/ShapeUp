//
//  CanvasViewDropInteractorDelegate.swift
//  Photify
//
//  Created by Galushka on 8/9/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation
import struct CoreGraphics.CGPoint

protocol CanvasViewDropInteractorDelegate: AnyObject {
    func canvasDropInteractor(_ dropInteractor: CanvasViewDropInteractor, dropShapeType shapeType: ShapeType, style: ShapeStyle, atLocation dropCenter: CGPoint)
}

