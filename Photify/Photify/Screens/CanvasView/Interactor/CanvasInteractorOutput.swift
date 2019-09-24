//
//  CanvasInteractorOutput.swift
//  Photify
//
//  Created by Galushka on 9/24/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol CanvasInteractorOutput: AnyObject {
    func didRefreshShapes(_ shapes: [Canvas.ShapeView])
    func didPlaceShape(_ shape: Canvas.ShapeView)
}
