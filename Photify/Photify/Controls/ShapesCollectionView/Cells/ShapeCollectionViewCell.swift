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
        shapeLayer.configure(shapeStyle: .empty)
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
    
    private func setup() {
        setupUI()
        configureDragInteraction()
    }
    
    private func setupUI() {
        self.shapeContainerView.embedLayer(shapeLayer)
        self.contentView.backgroundColor = Design.Colors.canvasBackgroundWhite
        self.contentView.layer.cornerRadius = 8.0
        
        self.shapeLayer.fillColor = nil
        self.shapeLayer.lineWidth = 3.0
        self.shapeLayer.lineJoin = .round
    }
    
    private func configureDragInteraction() {
        let dragInteraction = UIDragInteraction(delegate: self)
        self.contentView.addInteraction(dragInteraction)
    }
}

extension ShapeCollectionViewCell: UIDragInteractionDelegate {
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        guard let viewModel = self.viewModel else { return [] }
        
        let renderer = UIGraphicsImageRenderer(bounds: shapeLayer.frame)
        let contentViewSnapshotImage = renderer.image { (context) in
            self.shapeLayer.render(in: context.cgContext)
        }
        
        let itemProvider = NSItemProvider(object: contentViewSnapshotImage)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = (viewModel.shape, viewModel.shapeStyle)
        
        return [dragItem]
    }
}


extension ShapeCollectionViewCell: ShapeCollectionViewCellConfigurable {
    
    func configure(_ viewModel: ViewModel) {
        self.viewModel = viewModel
        self.shapeLayer.path = viewModel.shape.path(in: self.shapeContainerView.bounds)
        shapeLayer.configure(shapeStyle: viewModel.shapeStyle)
    }
}
