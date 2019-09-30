//
//  CanvasInteractorRouter.swift
//  Photify
//
//  Created by Galushka on 9/25/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class CanvasInteractionMediator {
    let canvasID: UUID
    let interactor: CanvasInteractor
    private var preseters = NSHashTable<CanvasPresenter>.weakObjects()
    
    init(canvasID: UUID, interactor: CanvasInteractor) {
        self.canvasID = canvasID
        self.interactor = interactor
        
        interactor.output = self
    }
    
    func addPresenter(_ presenter: CanvasPresenter) {
        preseters.add(presenter)
    }
}

extension CanvasInteractionMediator: CanvasInteractorOutput {
    func didRefreshShapes(_ shapes: [Canvas.ShapeView]) {
        self.preseters.allObjects.forEach { $0.didRefreshShapes(shapes) }
    }
    
    func didPlaceShape(_ shape: Canvas.ShapeView) {
        self.preseters.allObjects.forEach { $0.didPlaceShape(shape) }
    }
}

extension CanvasInteractionMediator: CanvasInteractorInput {
    func canvasName() -> String {
        return self.interactor.canvasName()
    }
    
    func refreshShapes() {
        self.interactor.refreshShapes()
    }
    
    func placeShape(ofType shapeType: ShapeType, style: ShapeStyle, at frame: CGRect) {
        self.interactor.placeShape(ofType: shapeType, style: style, at: frame)
    }
}

