//
//  CanvasContainerView.swift
//  Photify
//
//  Created by Galushka on 8/20/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class CanvasContainerView: UIView {
    
    // MARK: - Properties(Public)
    
    private(set) var canvasSize: CGSize
    private let underlyingCanvasView: UIView
    
    // MARK: - Initializers
    
    required init(canvasSize: CGSize) {
        let frame = Self.frame(fromCanvasSize: canvasSize)
        let canvasFrame = Self.canvasFrame(fromContainerFrame: frame, canvasSize: canvasSize)
        
        self.canvasSize = canvasSize
        self.underlyingCanvasView = Self.buildCanvasView(frame: canvasFrame)
        
        super.init(frame: frame)
        
        self.addSubview(underlyingCanvasView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Static Methods
    
    private static func frame(fromCanvasSize canvasSize: CGSize) -> CGRect {
        let screenBounds = UIScreen.main.bounds
        let maxDimension = max(screenBounds.width, screenBounds.height)
        
        let size = CGSize(width: max(maxDimension, canvasSize.width),
                          height: max(maxDimension, canvasSize.height))
        
        return CGRect(origin: .zero, size: size)
    }
    
    private static func canvasFrame(fromContainerFrame conteinerFrame: CGRect, canvasSize: CGSize) -> CGRect {
        let canvasFrame = CGRect(center: conteinerFrame.center, size: canvasSize)
        return canvasFrame
    }
    
    private static func buildCanvasView(frame: CGRect) -> UIView {
        return CanvasViewBuilder(frame: frame)
            .shadow()
            .border()
            .retrieveCanvasView()
    }
}

private extension CanvasContainerView {
    
    /*
     Note: Using approach where configuration method returns self class and final method that returns constructed targeted object.
     This approach has been borrowed in Builder design pattern article, link - https://refactoring.guru/design-patterns/builder/swift/example#example-1
     */
    
    class CanvasViewBuilder {
        private let frame: CGRect
        private let canvasView: UIView
        
        init(frame: CGRect) {
            self.frame = frame
            self.canvasView = UIView(frame: frame)
        }
        
        func shadow(offset: CGSize = CGSize(width: 1.0, height: 1.0), opacity: Float = 0.3) -> Self {
            canvasView.layer.shadowOffset = offset
            canvasView.layer.shadowOpacity = opacity
            
            return self
        }
        
        func border(width: CGFloat = 1.0, color: CGColor = UIColor.lightGray.cgColor) -> Self {
            canvasView.layer.borderWidth = width
            canvasView.layer.borderColor = color
            
            return self
        }
        
        /*
         Method name was got from Builder design pattern article, link - https://refactoring.guru/design-patterns/builder/swift/example#example-0
         */
        
        func retrieveCanvasView() -> UIView {
            return canvasView
        }
    }
}
