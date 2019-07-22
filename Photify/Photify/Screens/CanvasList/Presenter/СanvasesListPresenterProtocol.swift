//
//  СanvasesListPresenter.swift
//  Photify
//
//  Created by Galushka on 7/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol CanvasesListPresenterProtocol: AnyObject {
    func viewLoaded()
    func addCanvasPressed(name: String)
    func removeCanvasPressed(canavas canvasToDelete: Canvas)
    func didTapOnCanvas(_ canvas: Canvas)
    func didTapSaveCanvases()
}
