//
//  CanvasPresenter.swift
//  Photify
//
//  Created by Galushka on 7/23/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class CanvasPresenter: CanvasPresenterInput {
    
    // MARK: Properties(Private)
    
    private weak var interactor: CanvasInteractorInput?
    
    // MARK: Properties(Public)
    
    weak var view: CanvasViewInput?
    weak var output: CanvasPresenterOutput?
    
    // MARK: Initializers
    
    init(interactor: CanvasInteractorInput) {
        self.interactor = interactor
    }
    
    // MARK: - CanvasPresenterProtocol Imp
    
    func viewLoaded() {
        self.view?.setTitleText(to: interactor?.canvasName() ?? "")
        self.interactor?.refreshShapes()
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
