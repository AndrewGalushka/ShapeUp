//
//  CanvasPresenter.swift
//  Photify
//
//  Created by Galushka on 7/23/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class CanvasPresenter: CanvasPresenterProtocol {
    
    // MARK: Properties(Private)
    
    private let canvasService: CanvasServiceProtocol
    
    // MARK: Properties(Public)
    
    weak var view: CanvasView?
    weak var output: CanvasPresenterOutput?
    
    // MARK: Initializers
    
    init(canvasService: CanvasServiceProtocol) {
        self.canvasService = canvasService
    }
    
    // MARK: - CanvasPresenterProtocol Imp
    
    func viewLoaded() {
        self.view?.setTitleText(to: canvasService.canvas.name)
        self.canvasService.refresh()
        self.view?.displayShapes(canvasService.canvas.shapes)
    }
    
    func handleShapeDrop(shapeType: ShapeType, style: ShapeStyle, atLocation center: CGPoint, size: CGSize) {
        let shapeFrame = CGRect(center: center, size: size)
        let shapeType = shapeType
        let color = style.fillStyle.color
        
        let shapeViewModel = Canvas.ShapeView(origin: shapeFrame.origin,
                                              size: shapeFrame.size,
                                              shapeType: shapeType,
                                              color: color)
        
        self.canvasService.saveShapeView(shapeViewModel)
        self.view?.addShapeToDisplay(shapeViewModel)
    }
}
