//
//  CanvasInteractor.swift
//  Photify
//
//  Created by Galushka on 9/24/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class CanvasInteractor {
    
    // MARK: Properties(Private)
    
    private let canvasService: CanvasServiceProtocol
    
    // MARK: Properties(Public)
    
    weak var presenter: CanvasPresenterProtocol?
    weak var output: CanvasInteractorOutput?
    
    // MARK: Initializers
    
    init(canvasService: CanvasServiceProtocol) {
        self.canvasService = canvasService
    }
}

extension CanvasInteractor: CanvasInteractable {
    
    func refreshShapes() {
        self.canvasService.refresh()
        self.output?.didRefreshShapes(canvasService.canvas.shapes)
    }
    
    func placeShape(ofType shapeType: ShapeType, style: ShapeStyle, at frame: CGRect) {
        let color = style.fillStyle.color
        
        let shapeViewModel = Canvas.ShapeView(origin: frame.origin,
                                              size: frame.size,
                                              shapeType: shapeType,
                                              color: color)
        
        self.canvasService.saveShapeView(shapeViewModel)
        self.output?.didPlaceShape(shapeViewModel)
    }
}
