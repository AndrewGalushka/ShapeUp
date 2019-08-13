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
        let layout = ShapesCollectionViewLayout()
        layout.scrollDirection = .horizontal
        let tableView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        let usesAutoLayout = !self.translatesAutoresizingMaskIntoConstraints
        UIView.embed(view: tableView, inside: self, usingAutoLayout: usesAutoLayout)
        
        return tableView
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
        return ShapesProvider().allExistingShapeTypes().map {
            ViewModel(shapeType: $0, color: Color(uiColor: .random()))
        }
    }()
    
    private func setUp() {
        self.configureCollectionView()
    }
    
    private func configureCollectionView() {
        self.collectionView.backgroundColor = .clear
        self.collectionView.showsHorizontalScrollIndicator = false
        
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
            shapeCell.configure(.init(shapeType: viewModel.shapeType,
                                      shapeStyle: ShapeStyle(fillColor: viewModel.color)))
        }
            
        return cell
    }
}
