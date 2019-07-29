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
        let shape: Shape
        let shapeStyle: ShapeStyle
        
        init(shape: Shape, shapeStyle: ShapeStyle) {
            self.shape = shape
            self.shapeStyle = shapeStyle
        }
    }
}

protocol ShapeCollectionViewCellConfigurable {
    func configure(_ viewModel: ShapeCollectionViewCell.ViewModel)
}
