//
//  UIViewController+Storyboard.swift
//  Photify
//
//  Created by Galushka on 7/10/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

protocol StoryboardLoadable {
    static func loadFromStoryboard() -> Self
}

extension StoryboardLoadable where Self: UIViewController {
    static func loadFromStoryboard() -> Self {
        let bundle = Bundle(for: self)
        let storyboard = UIStoryboard(name: "\(self)", bundle: bundle)
        return storyboard.instantiateInitialViewController() as! Self
    }
}

extension UIViewController: StoryboardLoadable {}
