//
//  ShapesProvider.swift
//  Photify
//
//  Created by Galushka on 7/24/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

class ShapesProvider {
    
    func allExistingShapes() -> [Shape] {
        return [Rectangle(),
                Circle(),
                Ellipse(),
                Hexagon(),
                Triangle(),
                Star(),
                XMark()]
    }
}
