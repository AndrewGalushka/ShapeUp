//
//  CanvasTableViewDelegate.swift
//  Photify
//
//  Created by Galushka on 7/22/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol CanvasTableViewDelegate: AnyObject {
    func canvasTableView(_ canvasTableView: CanvasTableView, didSelectCanvas selectedCanvas: Canvas)
}
