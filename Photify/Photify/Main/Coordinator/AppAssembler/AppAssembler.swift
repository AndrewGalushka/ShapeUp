//
//  AppAssembler.swift
//  Photify
//
//  Created by Galushka on 7/10/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

class AppAssembler: AppAssemblerType {
    private lazy var coreDataManager: CoreDataManager = CoreDataManager()
    
    func assembleDataBaseManager() -> CoreDataManager {
        return coreDataManager
    }
}
