//
//  DataBaseAdapter.swift
//  Photify
//
//  Created by Galushka on 7/18/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol DataBaseAdapter {
    func fetchAllCanvases() -> [Canvas]
    func saveCanvas(_ canvas: Canvas)
}
