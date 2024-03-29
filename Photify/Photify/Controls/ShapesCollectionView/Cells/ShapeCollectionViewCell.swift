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
    
    // MARK: - Properties(Private)
    
    private var shapeLayer = CAShapeLayer()
    private var viewModel: ViewModel?
    
    private var underlyingShape: Shape? {
        guard let viewModel = self.viewModel else { return nil }
        return ShapesProvider.createShape(basedOn: viewModel.shapeType)
    }
    
    // MARK: - Lifecycle
    
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
        
        if let underlyingShape = self.underlyingShape {
            shapeContainerView.setNeedsLayout()
            shapeContainerView.layoutIfNeeded()
            shapeLayer.path = underlyingShape.path(in: self.shapeContainerView.bounds)
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
        
        // NOTE: For iPhone devices we mast explicitly set this property
        // For iPad this is enabled by default
        dragInteraction.isEnabled = true
        
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
        dragItem.localObject = ShapesDragAndDropDTO(shapeType: viewModel.shapeType, shapeStyle: viewModel.shapeStyle)
        
        return [dragItem]
    }
}


extension ShapeCollectionViewCell: ShapeCollectionViewCellConfigurable {
    
    func configure(_ viewModel: ViewModel) {
        self.viewModel = viewModel
        self.shapeLayer.path = underlyingShape!.path(in: self.shapeContainerView.bounds)
        shapeLayer.configure(shapeStyle: viewModel.shapeStyle)
    }
}
