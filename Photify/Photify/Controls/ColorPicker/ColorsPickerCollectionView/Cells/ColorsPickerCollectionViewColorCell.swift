//
//  ColorsPickerCollectionViewColorCell.swift
//  Photify
//
//  Created by Galushka on 7/25/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class ColorsPickerCollectionViewColorCell: UICollectionViewCell {

    // MARK: - IBOutlet
    
    @IBOutlet private weak var coloredCircleView: ColoredCircleView!
    
    // MARK: - Properties(Public)
    
    weak var delegate: ColorPickerCellDelegate?
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clear()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods(Public)
    
    func configure(color: UIColor) {
        self.coloredCircleView.color = color
    }
    
    // MARK: - Methods(Private)
    
    private func clear() {
        self.coloredCircleView.color = nil
    }
    
    // MARKL - IBActions
    
    @IBAction private func circleButtonTouchUpInsideActionHandler(_ sender: Any) {
        self.delegate?.colorCell(self, pressedWithColor: coloredCircleView.color)
    }
}

extension ColorsPickerCollectionViewColorCell {
    static var reuseIdentifier: String {
        return "\(self)"
    }
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }
    
    static var nibName: String {
        return reuseIdentifier
    }
}
