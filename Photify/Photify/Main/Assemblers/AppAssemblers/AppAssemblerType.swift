//
//  AppAssemblerType.swift
//  Photify
//
//  Created by Galushka on 7/9/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol AppAssemblerType {
    var isLoaded: Bool { get }
    func loadInternalData()
    func assembleStorageManager() -> StorageManageable
}
