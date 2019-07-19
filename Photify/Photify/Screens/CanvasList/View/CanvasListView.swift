//
//  CanvasListView.swift
//  Photify
//
//  Created by Galushka on 7/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol CanvasListView: AnyObject {
    func displayCanvases(_ canvases: [Canvas])
}
