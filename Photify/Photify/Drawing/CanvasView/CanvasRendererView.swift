//
//  CanvasRendererView.swift
//  Photify
//
//  Created by Galushka on 8/16/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

@IBDesignable
class CanvasRendererView: UIView {
    private var canvasRederer: CanvasRenderer = CanvasRenderer()
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        canvasRederer.render(on: context, in: rect)
    }
}

class CanvasRenderer {
    func render(on context: CGContext, in rect: CGRect) {
        self.renderBackground(context, rect)
    }
    
    private func renderBackground(_ context: CGContext, _ rect: CGRect) {
        UIColor.random().set()
    }
}
