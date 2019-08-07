//
//  StoreManageable.swift
//  Photify
//
//  Created by Galushka on 7/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation
import DataStorage

protocol StoreManageable: CanvasStorable {
    
    /// Synchronously load persistent storage
    static func loadStorage() -> Self
}

protocol CanvasStorable: AnyObject {
    
    // MARK - Write
    
    func saveCanvases(_ canvases: [Canvas])
    func deleteCanvases(_ canvases: [Canvas])
    
    // MARK - Read
    
    func fetchAllCanvases() -> [Canvas]
}



