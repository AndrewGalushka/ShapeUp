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
        UIView.embed(view: scrollView, inside: self, usingAutoLayout: !self.translatesAutoresizingMaskIntoConstraints)
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
    
    // MARK: - Methods(Public)
    
    func zoomToFit(animated: Bool = true, edgeInset: CGFloat = 0) {
        
        guard let contentView = self.contentView else { return }
        
        let scrollViewSize: CGSize
        
        if #available(iOS 12.0, *) {
            scrollViewSize = underlyingScrollView.visibleSize
        } else {
            scrollViewSize = underlyingScrollView.frame.size
        }
        
        let contentViewSize = contentView.bounds
        let newContentSizeBasedEdgeInsets = CGSize(width: (contentViewSize.width + edgeInset * 2),
                                                   height: (contentViewSize.height + edgeInset * 2))
        
        var scaleNeededToFit = min(scrollViewSize.width / newContentSizeBasedEdgeInsets.width,
                                   scrollViewSize.height / newContentSizeBasedEdgeInsets.height)
        
        if scaleNeededToFit > 1 {
            scaleNeededToFit = 1
        }
        
        self.setZoomScale(scaleNeededToFit, animated: animated)
    }
    
    func setZoomScale(_ scale: CGFloat, animated: Bool = false) {
        self.underlyingScrollView.setZoomScale(scale, animated: animated)
    }
    
    // MARK: - Methods(Private)
    
    private func setup() {
        underlyingScrollView.delegate = self
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
        func contentView(_ contentView: CanvasContainerView?) -> Self {
            canvasScrollView.contentView = contentView
            return self
        }
        
        @discardableResult
        func zoomMinMaxScale(minimumZoomScale: CGFloat = 0.5, maximumZoomScale: CGFloat = 3.0) -> Self {
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
