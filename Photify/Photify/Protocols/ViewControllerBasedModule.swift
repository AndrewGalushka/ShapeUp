//
//  ViewControllerBasedModule.swift
//  Photify
//
//  Created by Galushka on 7/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

protocol ViewControllerBasedModule: AnyObject {
    var asViewController: UIViewController { get }
}
