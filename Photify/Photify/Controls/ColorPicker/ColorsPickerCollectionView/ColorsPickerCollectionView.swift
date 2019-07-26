//
//  ColorsPickerCollectionView.swift
//  Photify
//
//  Created by Galushka on 7/25/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class ColorsPickerCollectionView: UIView {
    
    // MARK: Properties(Public)
    
    var colors: [UIColor] = [UIColor]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: Properties(Private)
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: ColorsPickerCollectionViewLayout())
        let isAutolayoutEnabled = !self.translatesAutoresizingMaskIntoConstraints
        UIView.embed(view: cv, inside: self, usingAutoLayout: isAutolayoutEnabled)
        
        cv.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi) // 180 degrees
        
        return cv
    }()
    
    var didSelectColorHandler: ((_ color: UIColor?) -> Void)?
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    init(autoLayoutEnabled: Bool) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = !autoLayoutEnabled
        setup()
    }
    
    // MARK: - Methods(Private)
    
    private func setup() {
        self.configureCollectionView()
    }
    
    private func configureCollectionView() {
        self.collectionView.backgroundColor = .white
        collectionView.register(ColorsPickerCollectionViewColorCell.nib,
                                forCellWithReuseIdentifier: ColorsPickerCollectionViewColorCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ColorsPickerCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let colorCell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorsPickerCollectionViewColorCell.reuseIdentifier,
                                                           for: indexPath) as! ColorsPickerCollectionViewColorCell
        
        colorCell.configure(color: self.colors[indexPath.row])
        colorCell.delegate = self
        
        return colorCell
    }
}

extension ColorsPickerCollectionView: ColorsPickerCollectionViewColorCellDelegate {
    func colorCell(_ colorCell: ColorsPickerCollectionViewColorCell, pressedWithColor color: UIColor?) {
        self.didSelectColorHandler?(color)
    }
}
