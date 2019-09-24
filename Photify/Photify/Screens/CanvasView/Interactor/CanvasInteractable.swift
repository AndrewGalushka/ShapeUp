//
//  CanvasInteractable.swift
//  Photify
//
//  Created by Galushka on 9/24/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

protocol CanvasInteractable: AnyObject {
    func canvasName() -> String
    func refreshShapes()
    func placeShape(ofType shapeType: ShapeType, style: ShapeStyle, at frame: CGRect)
}
