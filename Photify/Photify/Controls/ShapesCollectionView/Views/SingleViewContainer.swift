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
    private(set) var embededLayer: CALayer?
    
    private var isUsesAutolayout: Bool {
        return !self.translatesAutoresizingMaskIntoConstraints
    }
    
    func embedView(_ view: UIView) {
        self.clean()
        
        UIView.embed(view: view, inside: self, usingAutoLayout: isUsesAutolayout)
        self.embededView = view
    }
    
    func embedLayer(_ layer: CALayer) {
        self.clean()
        
        self.embededLayer?.frame = self.bounds
        self.layer.addSublayer(layer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let embededLayer = embededLayer {
            embededLayer.frame = self.bounds
        }
    }
    
    private func clean() {
        embededView?.removeFromSuperview()
        embededView = nil
        
        embededLayer?.removeFromSuperlayer()
        embededLayer = nil
    }
}
