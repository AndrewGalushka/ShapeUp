//
//  ShapesCollectionViewLayout.swift
//  Photify
//
//  Created by Galushka on 7/24/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class ShapesCollectionViewLayout: UICollectionViewFlowLayout {
    
    var orientationStyle: OrientationStyle = .horizontal
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = self.collectionView else { return }
        
        self.recalculateItemSize(for: collectionView)
    }
    
    private func recalculateItemSize(for collectionView: UICollectionView) {
        let contentAreaSize = collectionView.bounds.size
        let squareSideLength: CGFloat
        
        switch orientationStyle {
        case .horizontal:
            squareSideLength = contentAreaSize.height
        case .vertical:
            squareSideLength = contentAreaSize.width
        }
        
        self.itemSize = CGSize(width: squareSideLength,
                               height: squareSideLength)
    }
}

extension ShapesCollectionViewLayout {
    enum OrientationStyle {
        case vertical
        case horizontal
    }
}
