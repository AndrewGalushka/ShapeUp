//
//  ShapeCollectionViewCell.swift
//  Photify
//
//  Created by Galushka on 7/23/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class ShapeCollectionViewCell: UICollectionViewCell {

    // MARK: Properties(Private)
    
    private var shapeLayer = CAShapeLayer()
    private var viewModel: ViewModel?
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shapeLayer.frame = self.contentView.bounds
        self.contentView.layer.addSublayer(shapeLayer)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        shapeLayer.path = nil
        shapeLayer.fillColor = nil
        viewModel = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shapeLayer.frame = contentView.bounds
        
        if let viewModel = self.viewModel {
            shapeLayer.path = viewModel.shape.path(in: contentView.bounds)
        }
    }
}

extension ShapeCollectionViewCell: ShapeCollectionViewCellConfigurable {
    
    class ViewModel {
        let shape: Shape
        let color: UIColor
        
        init(shape: Shape, color: UIColor) {
            self.shape = shape
            self.color = color
        }
    }
    
    func configure(shape: Shape, color: UIColor) {
        contentView.layer.backgroundColor = UIColor.darkGray.cgColor
        contentView.clipsToBounds = true
        
        shapeLayer.path = shape.path(in: shapeLayer.bounds)
        shapeLayer.fillColor = color.cgColor
        
        viewModel = ViewModel(shape: shape, color: color)
    }
}

protocol ShapeCollectionViewCellConfigurable {
    func configure(shape: Shape, color: UIColor)
}
