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
    
    // MARK: - Properties(Public)
    
    weak var delegate: ColorPickerDelegate?
    
    // MARK - Properties(Private)
    
    private(set) var isExpanded: Bool = false {
        didSet {
            colorsCollectionView.isUserInteractionEnabled = isExpanded
        }
    }
    
    private(set) var expandDirection: ExpandDirection = .up {
        didSet {
            assert(ExpandDirection.up == expandDirection, "Only .up direction supports, other types will be implemented later")
        }
    }
    
    private let configs = Configurations()
    private lazy var parentCircle = ColoredCircleView()
    private lazy var expandingContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    private var colorsCollectionView: ColorsPickerCollectionView = {
        let collectionView = ColorsPickerCollectionView(autoLayoutEnabled: true)
        collectionView.colors = ColorPicker.defaultColorsPalette
        
        return collectionView
    }()
    
    private var expandingContainerHeightConstraint: NSLayoutConstraint?
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.updateLayoutForExpandingContainer()
    }
    
    // MARK: - Methods(Public)
    
    func toggleIsExpanded() {
        
        let shapeMask: CAShapeLayer
        
        if let existingShapeMask = self.expandingContainer.layer.mask as? CAShapeLayer {
            shapeMask = existingShapeMask
        } else {
            shapeMask = CAShapeLayer()
            expandingContainer.layer.mask = shapeMask
        }
        
        var startingPath: CGPath
        let finalPath: CGPath
        
        if self.isExpanded {
            startingPath = UIBezierPath(roundedRect: self.expandingContainer.bounds,
                                        cornerRadius: configs.circleRadiusFromDiameter).cgPath
            finalPath = UIBezierPath(roundedRect: CGRect(x: 0, y: expandingContainer.bounds.height, width: expandingContainer.bounds.width, height: 0),
                                     cornerRadius: configs.circleRadiusFromDiameter).cgPath
        } else {
            startingPath = UIBezierPath(roundedRect: CGRect(x: 0, y: expandingContainer.bounds.height, width: expandingContainer.bounds.width, height: 0),
                                        cornerRadius: configs.circleRadiusFromDiameter).cgPath
            finalPath = UIBezierPath(roundedRect: self.expandingContainer.bounds,
                                     cornerRadius: configs.circleRadiusFromDiameter).cgPath
        }
        
        if let currentAnimationPath = shapeMask.presentation()?.path {
            startingPath = currentAnimationPath
        }
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = startingPath
        animation.toValue = finalPath
        animation.duration = 0.25
        animation.timingFunction = .init(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        shapeMask.add(animation, forKey: kCATransition)
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        shapeMask.path = finalPath
        CATransaction.commit()
        
        self.isExpanded.toggle()
        
    }
    
    // MARK: - Methods(Private)
    
    private func setup() {
        configureColorsCollectionView()
        configureInitialLayout()
        setupParrentCircleButton()
        expandingContainer.layer.mask = CAShapeLayer()
    }
    
    private func configureColorsCollectionView() {
        self.colorsCollectionView.didSelectColorHandler = { [unowned self] (color: UIColor?) -> Void in
            self.toggleIsExpanded()
            self.parentCircle.color = color
            self.delegate?.colorPicker(self, didPickColor: Color(uiColor: color ?? .white))
        }
        
        colorsCollectionView.isUserInteractionEnabled = isExpanded
        
        UIView.embed(view: colorsCollectionView, inside: expandingContainer, usingAutoLayout: true)
    }
    
    private func configureInitialLayout() {
        embedParentCircle()
        embedExpandingContainer()
    }
    
    private func embedParentCircle() {
        self.parentCircle.removeFromSuperview()
        self.addSubview(parentCircle)
        
        parentCircle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [parentCircle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             parentCircle.widthAnchor.constraint(equalToConstant: configs.circleDiameter),
             parentCircle.heightAnchor.constraint(equalToConstant: configs.circleDiameter),
             parentCircle.bottomAnchor.constraint(equalTo: self.bottomAnchor)]
        )
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

    private func setupParrentCircleButton() {
        let parrentCircleButton = UIButton(type: .custom)
        parrentCircleButton.backgroundColor = .clear
        parrentCircleButton.addTarget(self, action: #selector(parentCircleButtonTouchUpInsideActionHandler(_:)),
                                      for: .touchUpInside)
        
        UIView.embed(view: parrentCircleButton,
                     inside: self.parentCircle,
                     usingAutoLayout: true)
    }
    
    private func updateLayoutForExpandingContainer() {
        guard let expandingContainerHeightConstraint = self.expandingContainerHeightConstraint else { return }
        let containerSize = calculateContainerSize()
        
        assert(self.expandDirection == ExpandDirection.up, "Only .up direction supports, other types will be implemented later")
        
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
    
    @objc private func parentCircleButtonTouchUpInsideActionHandler(_ button: UIButton) {
        self.toggleIsExpanded()
    }
}

extension ColorPicker {
    struct Configurations {
        let circleDiameter: CGFloat = 50
        let insetsBetweenCircles: CGFloat = 8.0
        
        var circleRadiusFromDiameter: CGFloat {
            return circleDiameter / 2.0
        }
    }
    
    enum ExpandDirection: Int {
        case up
        case down
        case left
        case right
    }
}

extension ColorPicker {
    static var defaultColorsPalette: [UIColor] {
        return [.black,
                .darkGray,
                .lightGray,
                .white,
                .gray,
                .red,
                .green,
                .blue,
                .cyan,
                .yellow,
                .magenta,
                .orange,
                .purple,
                .brown,
                .spaceGray]
    }
}
