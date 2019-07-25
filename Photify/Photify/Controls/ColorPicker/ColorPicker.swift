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
    private(set) var isExpanded: Bool = false
    
    private(set) var expandDirection: ExpandDirection = .up {
        didSet {
            assert(ExpandDirection.up == expandDirection, "Only .up direction supports, other types will be implemented later")
        }
    }
    
    private let configs = Configurations()
    private lazy var parentCircle = ColoredCircleView()
    private lazy var expandingContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    var expandingContainerHeightConstraint: NSLayoutConstraint?
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    var counter = 0
    
    override func updateConstraints() {
        super.updateConstraints()
        self.constraints.forEach {
            print($0)
        }
        
        print("updateConstraints: \(self.bounds.height)")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.updateLayoutForExpandingContainer()
        print("layoutSubviews: \(self.bounds.height)")
    }
    
    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        print("layoutMarginsDidChange: \(self.bounds.height)")
    }
    
    // MARK: - Methods(Public)
    
    func toggleIsExpanded() {
        self.expandDirection = .down
        
        let startingPath: CGPath
        let finalPath: CGPath
        
        if self.isExpanded {
            startingPath = CGPath(rect: CGRect(x: 0, y: expandingContainer.bounds.height, width: expandingContainer.bounds.width, height: 0),
                                  transform: nil)
            finalPath = CGPath(rect: self.expandingContainer.bounds, transform: nil)
        } else {
            startingPath = CGPath(rect: self.expandingContainer.bounds, transform: nil)
            finalPath = CGPath(rect: CGRect(x: 0, y: expandingContainer.bounds.height, width: expandingContainer.bounds.width, height: 0),
                               transform: nil)
        }
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = startingPath
        self.expandingContainer.layer.mask = maskLayer
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = maskLayer.path
        animation.toValue = finalPath
        animation.duration = 0.25
        animation.timingFunction = .init(name: CAMediaTimingFunctionName.easeOut)
        
        maskLayer.add(animation, forKey: nil)
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        maskLayer.path = finalPath
        CATransaction.commit()
        
        self.isExpanded.toggle()
        
    }
    
    // MARK: - Methods(Private)
    
    private func setup() {
        self.configureInitialUI()
        expandingContainer.layer.mask = CAShapeLayer()
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
        self.expandingContainer.removeFromSuperview()
        self.expandingContainer.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(expandingContainer, belowSubview: parentCircle)
        
        let containerSize = calculateContainerSize()
        
        self.expandingContainer.widthAnchor.constraint(equalToConstant: containerSize.width).isActive = true
        self.expandingContainerHeightConstraint = self.expandingContainer.heightAnchor.constraint(equalToConstant: containerSize.height)
        expandingContainerHeightConstraint?.isActive = true
        
        switch expandDirection {
        case .up:
            expandingContainer.centerXAnchor.constraint(equalTo: parentCircle.centerXAnchor).isActive = true
            expandingContainer.bottomAnchor.constraint(equalTo: parentCircle.topAnchor, constant: -configs.insetsBetweenCircles).isActive = true
        case .down:
            fatalError("Unsapported Type, need to be implemented later")
//            expandingContainer.centerXAnchor.constraint(equalTo: parentCircle.centerXAnchor).isActive = true
//            expandingContainer.topAnchor.constraint(equalTo: parentCircle.bottomAnchor, constant: -configs.insetsBetweenCircles).isActive = true
        case .left:
            fatalError("Unsapported Type, need to be implemented later")
//            expandingContainer.centerYAnchor.constraint(equalTo: parentCircle.centerYAnchor).isActive = true
//            expandingContainer.leftAnchor.constraint(equalTo: parentCircle.trailingAnchor, constant: -configs.insetsBetweenCircles)
        case .right:
            fatalError("Unsapported Type, need to be implemented later")
//            expandingContainer.centerYAnchor.constraint(equalTo: parentCircle.centerYAnchor).isActive = true
//            expandingContainer.rightAnchor.constraint(equalTo: parentCircle.leftAnchor, constant: -configs.insetsBetweenCircles)
        }
    }

    func updateLayoutForParentCircle() {
        
    }
    
    func updateLayoutForExpandingContainer() {
        guard let expandingContainerHeightConstraint = self.expandingContainerHeightConstraint else { return }
        let containerSize = calculateContainerSize()
        
        assert(self.expandDirection == ExpandDirection.up, fatalError("Only .up direction supports, other types will be implemented later"))
        
        expandingContainerHeightConstraint.constant = containerSize.height
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
    
    enum ExpandDirection: Int {
        case up
        case down
        case left
        case right
    }
}
