//
//  UIView+Extensions.swift
//  Photify
//
//  Created by Galushka on 7/24/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

extension UIView {
    
    static func embed(view embeddingView: UIView, inside container: UIView, usingAutoLayout: Bool) {
        embeddingView.frame = container.bounds
        container.addSubview(embeddingView)
        
        if usingAutoLayout {
            embeddingView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate(
                [embeddingView.topAnchor.constraint(equalTo: container.topAnchor),
                 embeddingView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
                 embeddingView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
                 embeddingView.trailingAnchor.constraint(equalTo: container.trailingAnchor)]
            )
        } else {
            embeddingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
}
