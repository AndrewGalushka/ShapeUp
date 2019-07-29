//
//  ShapesList.swift
//  Photify
//
//  Created by Galushka on 7/23/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class ShapesCollectionView: UIView {
    
    // MASK: - Properties(Private)
    
    private lazy var collectionView: UICollectionView = {
        let tb = UICollectionView(frame: .zero, collectionViewLayout: ShapesCollectionViewLayout())
        
        self.addSubview(tb)
        
        if self.translatesAutoresizingMaskIntoConstraints {
            tb.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        } else {
            tb.translatesAutoresizingMaskIntoConstraints = false
            tb.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            tb.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            tb.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            tb.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        }
        
        return tb
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    // MARK: - Methods(Public)
    
    func setShapes(_ shapes: [ViewModel]) {
        self.shapes = shapes
        self.collectionView.reloadData()
    }
    
    func changeShapesColors(to color: Color) {
        for i in shapes.indices {
            shapes[i].color = color
        }
        self.collectionView.reloadData()
    }
    
    // MARK: - Methods(Private)
    
    private var shapes: [ViewModel] = { () -> [ViewModel] in
        return ShapesProvider().allExistingShapes().map {
            ViewModel(shape: $0, color: Color(uiColor: .random()))
        }
    }()
    
    private func setUp() {
        self.configureCollectionView()
    }
    
    private func configureCollectionView() {
        self.collectionView.backgroundColor = .white
        collectionView.register(UINib(nibName: "\(ShapeCollectionViewCell.self)", bundle: nil),
                                forCellWithReuseIdentifier: "\(ShapeCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ShapesCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shapes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = shapes[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ShapeCollectionViewCell.self)", for: indexPath)
        
        if let shapeCell = cell as? ShapeCollectionViewCellConfigurable {
            shapeCell.configure(.init(shape: viewModel.shape,
                                      color: viewModel.color))
        }
            
        return cell
    }
}
