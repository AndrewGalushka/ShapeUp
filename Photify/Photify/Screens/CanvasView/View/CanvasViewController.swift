//
//  CanvasViewController.swift
//  Photify
//
//  Created by Galushka on 7/8/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var bottomControlsContainerView: UIView!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var colorPicker: ColorPicker!
    @IBOutlet private weak var shapesCollectionView: ShapesCollectionView!
    
    // MARK: Properties(Private)
    
    private var canvasDropInteractor: CanvasViewDropInteractor!
    
    // MARK: - Properties(Public)
    
    weak var presenter: CanvasPresenterProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        self.presenter?.viewLoaded()
    }
    
    // MARK: - Methods(Private)
    
    private func setup() {
        configureScrollView()
        configureColorPicker()
        configureDropInteraction()
    }
    
    private func configureScrollView() {
        scrollView.panGestureRecognizer.minimumNumberOfTouches = 2
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        scrollView.backgroundColor = Design.Colors.canvasBackgroundWhite
    }
    
    private func configureColorPicker() {
        colorPicker.delegate = self
    }
    
    private func configureDropInteraction() {
        canvasDropInteractor = CanvasViewDropInteractor(parentView: self.view, scrollView: scrollView)
        canvasDropInteractor.delegate = self
        canvasDropInteractor.configure()
    }
}

extension CanvasViewController: CanvasViewDropInteractorDelegate {
    func canvasDropInteractor(_ dropInteractor: CanvasViewDropInteractor,
                              dropShapeType shapeType: ShapeType,
                              style: ShapeStyle,
                              atLocation dropCenter: CGPoint) {
        let shapeFrame = CGRect(center: dropCenter, size: .init(width: 72, height: 72))
        
        let shape = ShapesProvider.convertToShape(from: shapeType)
        let shapeView = ShapeView(shape: AnyShape(shape: shape))
        
        shapeView.shapeLayer.configure(shapeStyle: style)
        shapeView.frame = shapeFrame
        self.scrollView.addSubview(shapeView)
        
        presenter?.handleShapeDrop(shapeType: shapeType, style: style, atLocation: dropCenter, size: shapeFrame.size)
    }
}

extension CanvasViewController: CanvasView {
    func displayShapes(_ shapeViewModels: [Canvas.ShapeView]) {
        
        for shapeViewModel in shapeViewModels {
            let shape = ShapeViewRepresentation.shapeFromShapeType(shapeViewModel.shapeType)
            let shapeView = ShapeView(shape: AnyShape(shape: shape),
                                      frame: CGRect(origin: shapeViewModel.origin, size: shapeViewModel.size))
            
            shapeView.fillColor = shapeViewModel.color?.uiColor.cgColor
            self.scrollView.addSubview(shapeView)
        }
    }
    
    func setTitleText(to text: String) {
        self.title = text
    }
}

extension CanvasViewController: ColorPickerDelegate {
    
    func colorPicker(_ colorPicker: ColorPicker, didPickColor pickedColor: Color?) {
        self.shapesCollectionView.changeShapesColors(to: pickedColor!)
    }
}
