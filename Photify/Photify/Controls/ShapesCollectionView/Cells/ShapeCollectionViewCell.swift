//
//  ShapeCollectionViewCell.swift
//  Photify
//
//  Created by Galushka on 7/23/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class ShapeCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var shapeContainerView: SingleViewContainer!
    
    // MARK: Properties(Private)
    
    private var shapeLayer = CAShapeLayer()
    private var viewModel: ViewModel?
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        shapeLayer.path = nil
        shapeLayer.fillColor = nil
        viewModel = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let viewModel = self.viewModel {
            shapeContainerView.setNeedsLayout()
            shapeContainerView.layoutIfNeeded()
            shapeLayer.path = viewModel.shape.path(in: self.shapeContainerView.bounds)
        }
    }
    
    // MARK: - Methods(Private)
    
    func setup() {
        self.shapeContainerView.embedLayer(shapeLayer)
        self.contentView.backgroundColor = .init(red: 239 / 255.0, green: 237 / 255.0, blue: 238 / 255.0, alpha: 1.0)
        self.contentView.layer.cornerRadius = 8.0
        
        self.shapeLayer.fillColor = nil
        self.shapeLayer.lineWidth = 3.0
        self.shapeLayer.lineJoin = .round
    }
}

extension ShapeCollectionViewCell: ShapeCollectionViewCellConfigurable {

    func configure(_ viewModel: ViewModel) {
        self.viewModel = viewModel
        self.shapeLayer.path = viewModel.shape.path(in: self.shapeContainerView.bounds)
        shapeLayer.strokeColor = UIColor(rgbaColor: viewModel.color).cgColor
    }
    
    struct ViewModel {
        let shape: Shape
        let color: Color
        
        init(shape: Shape, color: Color) {
            self.shape = shape
            self.color = color
        }
    }
}

protocol ShapeCollectionViewCellConfigurable {
    func configure(_ viewModel: ShapeCollectionViewCell.ViewModel)
}
