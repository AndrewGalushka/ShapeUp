//
//  ColorPickerDelegate.swift
//  Photify
//
//  Created by Galushka on 7/26/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

protocol ColorPickerDelegate: AnyObject {
    func colorPicker(_ colorPicker: ColorPicker, didPickColor pickedColor: Color?)
}
