//
//  DebugPrint.swift
//  Photify
//
//  Created by Galushka on 8/16/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

func debugPrint(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
        print(items, separator: separator, terminator: terminator)
    #endif
}
