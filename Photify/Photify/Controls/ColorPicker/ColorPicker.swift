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
    var expandDirection: ExpandDirection = .up {
        didSet {
            self.embedExpandingContainer()
        }
    }
    
    private(set) var isExpanded = false
    private let configs = Configurations()
    private lazy var parentCircle = ColoredCircle()
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
    
    // MARK: - Methods(Private)
    
    private func setup() {
        self.embedParentCircle()
    }
    
    private func configureInitialUI() {
        embedParentCircle()
    }
    
    private func embedParentCircle() {
        self.addSubview(parentCircle)
        parentCircle.translatesAutoresizingMaskIntoConstraints = false
        
        parentCircle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        parentCircle.widthAnchor.constraint(equalToConstant: configs.circleDiameter).isActive = true
        parentCircle.heightAnchor.constraint(equalToConstant: configs.circleDiameter).isActive = true
        parentCircle.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func embedExpandingContainer() {
        self.insertSubview(expandingContainer, belowSubview: parentCircle)
        self.expandingContainer.translatesAutoresizingMaskIntoConstraints = false
        
        switch expandDirection {
        case .up:
            parentCircle.centerXAnchor.constraint(equalTo: parentCircle.centerXAnchor).isActive = true
        case .down:
            break
        case .left:
            break
        case .right:
            break
        }
    }

    private func calcuateContainerSize() -> CGSize {
        let minItemLength = self.configs.circleDiameter
        let availableHeight = self.bounds.height - configs.circleDiameter - configs.insetsBetweenCircles
        let availableWidth = self.bounds.width - configs.circleDiameter - configs.insetsBetweenCircles
        
        switch expandDirection {
        case .up:
            break
        case .down:
            break
        case .left:
            break
        case .right:
            break
        }
        
        return .zero
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
