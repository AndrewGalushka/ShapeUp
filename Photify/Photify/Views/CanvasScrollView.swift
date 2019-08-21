//
//  CanvasScrollView.swift
//  Photify
//
//  Created by Galushka on 8/21/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class CanvasScrollView: UIView {
    
    // MARK: - Properties(Public)

    private var contentView: UIView? {
        willSet {
            if let previousView = contentView {
                previousView.removeFromSuperview()
            }
        }
        didSet {
            if let newView = contentView {
                self.underlyingScrollView.addSubview(newView)
            }
        }
    }
    
    var contentSize: CGSize {
        get {
            return underlyingScrollView.contentSize
        }
        
        set {
            underlyingScrollView.contentSize = newValue
        }
    }
    
    // MARK: - Properties(Private)
    
    private lazy var underlyingScrollView: CenteredContentScrollView = {
        let scrollView = CenteredContentScrollView()
        
        UIView.embed(view: scrollView, inside: self, usingAutoLayout: isUsesAutolayout)
        
        return scrollView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setup()
    }
    
    // MARK: - Methods(private)
    
    private func setup() {
        underlyingScrollView.delegate = self
    }
    
    private var isUsesAutolayout: Bool {
        return !self.translatesAutoresizingMaskIntoConstraints
    }
}

extension CanvasScrollView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.contentView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        underlyingScrollView.centerContent()
    }
}

extension CanvasScrollView {
    class Configurator {
        let canvasScrollView: CanvasScrollView
        
        init(canvasScrollView: CanvasScrollView) {
            self.canvasScrollView = canvasScrollView
        }
        
        @discardableResult
        func contentSize(_ contentSize: CGSize) -> Self {
            canvasScrollView.contentSize = contentSize
            return self
        }
        
        @discardableResult
        func zoom(minimumZoomScale: CGFloat = 0.3, maximumZoomScale: CGFloat = 3.0) -> Self {
            canvasScrollView.underlyingScrollView.minimumZoomScale = minimumZoomScale
            canvasScrollView.underlyingScrollView.maximumZoomScale = maximumZoomScale
            return self
        }
        
        @discardableResult
        func scrollViewBackgroundColor(_ color: UIColor) -> Self {
            canvasScrollView.backgroundColor = color
            return self
        }
    }
}
