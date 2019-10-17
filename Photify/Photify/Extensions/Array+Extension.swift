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

extension Array {
    func arrayByRemovingDuplicates<T: Hashable>(identifiedBy keyPath: KeyPath<Element, T>) -> [Element] {
        var resultingArray = self
        
        for index in 0..<count {
            var isFirstOccurrence = true
            let identifier = self[index][keyPath: keyPath]
            
            resultingArray.removeAll { (element) -> Bool in
                
                if element[keyPath: keyPath] == identifier {
                    
                    if isFirstOccurrence {
                        isFirstOccurrence = false
                        return false
                    }
                    
                    return true
                }
                
                return false
            }
        }
        
        return resultingArray
    }
}
