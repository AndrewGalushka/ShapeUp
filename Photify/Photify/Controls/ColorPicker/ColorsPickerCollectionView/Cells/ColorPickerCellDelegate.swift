//
//  ColorPickerCellDelegate.swift
//  Photify
//
//  Created by Galushka on 7/25/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

protocol ColorPickerCellDelegate: AnyObject {
    func colorCell(_ colorCell: ColorsPickerCollectionViewColorCell, pressedWithColor color: UIColor?)
}
