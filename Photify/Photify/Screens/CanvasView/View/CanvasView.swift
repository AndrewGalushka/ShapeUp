//
//  CanvasView.swift
//  Photify
//
//  Created by Galushka on 7/23/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol CanvasView: AnyObject {
    func setTitleText(to text: String)
    func displayShapes(_ shapeViewModels: [Canvas.ShapeView])
    func addShapeToDisplay(_ shapeViewModel: Canvas.ShapeView)
}
