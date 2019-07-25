//
//  ColorsPickerCollectionViewLayout.swift
//  Photify
//
//  Created by Galushka on 7/25/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class ColorsPickerCollectionViewLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        
        guard let collectionView = self.collectionView else { return }
        
        self.recalculateIndents(for: collectionView)
        self.recalculateItemSize(for: collectionView)
    }
    
    private func recalculateIndents(for collectionView: UICollectionView) {
        self.minimumInteritemSpacing = 0.0
        self.minimumLineSpacing = 8.0
        
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing,
                                         left: self.minimumInteritemSpacing,
                                         bottom: self.minimumInteritemSpacing,
                                         right: self.minimumInteritemSpacing)
    }
    
    private func recalculateItemSize(for collectionView: UICollectionView) {
        let numberOfItemsInRow = 1
        
        let numberOfInteritems: Int = (numberOfItemsInRow * 2 - 2) / 2
        let interitemsSpacing = (self.minimumInteritemSpacing * CGFloat(numberOfInteritems)).rounded(.down)
        
        let availableWidth = collectionView.bounds.width - sectionInset.left - sectionInset.right - interitemsSpacing
        
        let itemWidth = (availableWidth / CGFloat(numberOfItemsInRow)).rounded(.down)
        let itemHeight = itemWidth
        
        self.itemSize = CGSize(width: itemWidth,
                               height: itemHeight)
    }
}
