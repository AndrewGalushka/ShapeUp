//
//  CanvasPresenter.swift
//  Photify
//
//  Created by Galushka on 7/23/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

class CanvasPresenter: CanvasPresenterProtocol {
    // MARK: Properties(Private)
    
    let canvas: Canvas
    
    // MARK: Properties(Public)
    
    weak var view: CanvasView?
    weak var output: CanvasPresenterOutput?
    
    // MARK: Initializers
    
    init(canvas: Canvas) {
        self.canvas = canvas
    }
    
    // MARK: - CanvasPresenterProtocol Imp
    
    func viewLoaded() {
        self.view?.setTitleText(to: canvas.name)
    }
}
