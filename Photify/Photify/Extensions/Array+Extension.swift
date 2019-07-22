//
//  Array+Extension.swift
//  Photify
//
//  Created by Galushka on 7/22/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

extension Array {
    func item(at index: Int) -> Element? {
        guard index <= self.count else { return nil }
        return self[index]
    }
}
