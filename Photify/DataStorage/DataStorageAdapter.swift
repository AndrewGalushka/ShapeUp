//
//  DataStorageAdapter.swift
//  Database
//
//  Created by Galushka on 8/1/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

public protocol DataStorageAdapter {
    func load(completion: @escaping () -> Void)
    
    func fetchAllCanvases() -> [CanvasStorable]
    func saveCanvases(_ canvas: [CanvasStorable])
    func deleteCanvases(identifiers: [UUID])
}


