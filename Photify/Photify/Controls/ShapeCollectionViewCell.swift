//
//  ShapeCollectionViewCell.swift
//  Photify
//
//  Created by Galushka on 7/23/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class ShapeCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension ShapeCollectionViewCell: ShapeCollectionViewCellConfigurable {
    func configure(color: UIColor) {
        contentView.layer.cornerRadius = 10.0
        contentView.backgroundColor = color
        contentView.clipsToBounds = true
    }
}

protocol ShapeCollectionViewCellConfigurable {
    func configure(color: UIColor)
}
