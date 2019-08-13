//
//  ShapeCollectionViewCell+Configurable.swift
//  Photify
//
//  Created by Galushka on 7/29/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

extension ShapeCollectionViewCell {
    
    struct ViewModel {
        let shapeType: ShapeType
        let shapeStyle: ShapeStyle
        
        init(shapeType: ShapeType, shapeStyle: ShapeStyle) {
            self.shapeType = shapeType
            self.shapeStyle = shapeStyle
        }
    }
}

protocol ShapeCollectionViewCellConfigurable {
    func configure(_ viewModel: ShapeCollectionViewCell.ViewModel)
}
