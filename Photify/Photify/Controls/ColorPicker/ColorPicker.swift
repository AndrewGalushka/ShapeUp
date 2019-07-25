//
//  Palette.swift
//  Photify
//
//  Created by Galushka on 7/24/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

@IBDesignable
class ColorPicker: UIView {
    
    @IBInspectable
    private(set) var isExpanded: Bool = false {
        didSet {
            if isExpanded {
                expandingContainer.backgroundColor = .cyan
            } else {
                expandingContainer.backgroundColor = .red
            }
        }
    }
    
    private(set) var expandDirection: ExpandDirection = .up {
        didSet {
            setup()
        }
    }
    
    private let configs = Configurations()
    private lazy var parentCircle = ColoredCircleView()
    private lazy var expandingContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    // MARK: - Methods(Public)
    
    func toggleIsExpanded() {
        
        let startingPath: CGPath
        let finalPath: CGPath
        
        if self.isExpanded {
            startingPath = CGPath(rect: self.expandingContainer.bounds, transform: nil)
            finalPath = CGPath(rect: CGRect(x: 0, y: expandingContainer.bounds.height, width: expandingContainer.bounds.width, height: 0),
                                   transform: nil)
        } else {
            startingPath = CGPath(rect: CGRect(x: 0, y: expandingContainer.bounds.height, width: expandingContainer.bounds.width, height: 0),
                                  transform: nil)
            finalPath = CGPath(rect: self.expandingContainer.bounds, transform: nil)
        }
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = startingPath
        self.expandingContainer.layer.mask = maskLayer
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = maskLayer.path
        animation.toValue = finalPath
        animation.duration = 0.25
        animation.timingFunction = .init(name: CAMediaTimingFunctionName.easeOut)
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        maskLayer.path = finalPath
        CATransaction.commit()
        
        self.isExpanded.toggle()
        
    }
    
    // MARK: - Methods(Private)
    
    private func setup() {
        self.configureInitialUI()
    }
    
    private func configureInitialUI() {
        embedParentCircle()
        embedExpandingContainer()
    }
    
    private func embedParentCircle() {
        self.parentCircle.removeFromSuperview()
        self.addSubview(parentCircle)
        parentCircle.translatesAutoresizingMaskIntoConstraints = false
        
        parentCircle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        parentCircle.widthAnchor.constraint(equalToConstant: configs.circleDiameter).isActive = true
        parentCircle.heightAnchor.constraint(equalToConstant: configs.circleDiameter).isActive = true
        parentCircle.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func embedExpandingContainer() {
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        self.expandingContainer.removeFromSuperview()
        self.expandingContainer.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(expandingContainer, belowSubview: parentCircle)
        
        let containerSize = calculateContainerSize()
        
        self.expandingContainer.widthAnchor.constraint(equalToConstant: containerSize.width).isActive = true
        self.expandingContainer.heightAnchor.constraint(equalToConstant: containerSize.height).isActive = true
        
        switch expandDirection {
        case .up:
            expandingContainer.centerXAnchor.constraint(equalTo: parentCircle.centerXAnchor).isActive = true
            expandingContainer.bottomAnchor.constraint(equalTo: parentCircle.topAnchor, constant: -configs.insetsBetweenCircles).isActive = true
        case .down:
            expandingContainer.centerXAnchor.constraint(equalTo: parentCircle.centerXAnchor).isActive = true
            expandingContainer.topAnchor.constraint(equalTo: parentCircle.bottomAnchor, constant: -configs.insetsBetweenCircles).isActive = true
        case .left:
            expandingContainer.centerYAnchor.constraint(equalTo: parentCircle.centerYAnchor).isActive = true
            expandingContainer.leftAnchor.constraint(equalTo: parentCircle.trailingAnchor, constant: -configs.insetsBetweenCircles)
        case .right:
            expandingContainer.centerYAnchor.constraint(equalTo: parentCircle.centerYAnchor).isActive = true
            expandingContainer.rightAnchor.constraint(equalTo: parentCircle.leftAnchor, constant: -configs.insetsBetweenCircles)
        }
    }

    private func calculateContainerSize() -> CGSize {
        let minItemLength = self.configs.circleDiameter
        let availableHeight = self.bounds.height - configs.circleDiameter - configs.insetsBetweenCircles
        let availableWidth = self.bounds.width - configs.circleDiameter - configs.insetsBetweenCircles
        
        switch expandDirection {
        case .up, .down:
            let height = max(minItemLength, availableHeight)
            let width = configs.circleDiameter
            
            return CGSize(width: width,
                          height: height)
        case .left, .right:
            let width = max(minItemLength, availableWidth)
            let height = configs.circleDiameter
            
            return CGSize(width: width,
                          height: height)
        }
    }
}

extension ColorPicker {
    struct Configurations {
        let circleDiameter: CGFloat = 50
        let insetsBetweenCircles: CGFloat = 8.0
    }
    
    @objc enum ExpandDirection: Int {
        case up
        case down
        case left
        case right
    }
}
