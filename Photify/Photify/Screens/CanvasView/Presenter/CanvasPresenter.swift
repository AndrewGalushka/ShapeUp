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
    
    private weak var interactor: CanvasInteractable?
    
    // MARK: Properties(Public)
    
    weak var view: CanvasView?
    weak var output: CanvasPresenterOutput?
    
    // MARK: Initializers
    
    init(interactor: CanvasInteractable) {
        self.interactor = interactor
    }
    
    // MARK: - CanvasPresenterProtocol Imp
    
    func viewLoaded() {
//        self.view?.setTitleText(to: canvasService.canvas.name)
        self.interactor?.refreshShapes()
//        self.canvasService.refresh()
//        self.view?.displayShapes(canvasService.canvas.shapes)
    }
    
    func handleShapeDrop(shapeType: ShapeType, style: ShapeStyle, atLocation center: CGPoint, size: CGSize) {
        let shapeFrame = CGRect(center: center, size: size)
        let shapeType = shapeType
        
        self.interactor?.placeShape(ofType: shapeType, style: style, at: shapeFrame)
    }
}

extension CanvasPresenter: CanvasInteractorOutput {
    func didRefreshShapes(_ shapes: [Canvas.ShapeView]) {
        self.view?.displayShapes(shapes)
    }
    
    func didPlaceShape(_ shape: Canvas.ShapeView) {
        self.view?.addShapeToDisplay(shape)
    }
}
