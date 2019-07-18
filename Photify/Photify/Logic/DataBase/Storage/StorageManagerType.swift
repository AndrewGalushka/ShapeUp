//
//  StorageManager.swift
//  Photify
//
//  Created by Galushka on 7/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol StorageManagerType: AnyObject {
    
    // MARK - Initialization
    
    /// Synchronously load persistent storage
    static func loadStorage() -> Self
    
    // MARK - Write
    
    func saveCanvas(canvas: Canvas)
    
    // MARK - Read
    
    func fetchAllCanvases() -> [Canvas]
}
