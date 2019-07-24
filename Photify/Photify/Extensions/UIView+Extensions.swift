//
//  UIView+Extensions.swift
//  Photify
//
//  Created by Galushka on 7/24/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

extension UIView {
    
    static func embed(view embedingView: UIView, inside container: UIView, usingAutoLayout: Bool) {
        embedingView.frame = container.bounds
        container.addSubview(embedingView)
        
        if usingAutoLayout {
            embedingView.translatesAutoresizingMaskIntoConstraints = false
            embedingView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
            embedingView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
            embedingView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
            embedingView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        } else {
            embedingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
}
