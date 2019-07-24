//
//  SingleViewContainer.swift
//  Photify
//
//  Created by Galushka on 7/24/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class SingleViewContainer: UIView {
    private(set) var embededView: UIView?
    
    private var isUsesAutolayout: Bool {
        return !self.translatesAutoresizingMaskIntoConstraints
    }
    
    func embedView(_ view: UIView) {
        self.clean()
        
        UIView.embed(view: view, inside: self, usingAutoLayout: isUsesAutolayout)
        self.embededView = view
    }
    
    private func clean() {
        embededView?.removeFromSuperview()
        embededView = nil
    }
}
