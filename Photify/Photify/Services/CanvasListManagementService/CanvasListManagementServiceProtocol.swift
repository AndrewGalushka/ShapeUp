//
//  CanvasListManagementServiceProtocol.swift
//  Photify
//
//  Created by Galushka on 7/22/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol CanvasListManagementServiceProtocol: AnyObject {
    func fetchAllCanvases() -> [Canvas]
    func addCanvas(name: String)
    func deleteCanvas(_ canvas: Canvas)
    func saveChanges()
}
