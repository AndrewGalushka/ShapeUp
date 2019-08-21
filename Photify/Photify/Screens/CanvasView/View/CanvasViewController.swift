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
    @IBOutlet private weak var canvasScrollView: CanvasScrollView!
    @IBOutlet private weak var colorPicker: ColorPicker!
    @IBOutlet private weak var shapesCollectionView: ShapesCollectionView!
    
    @IBOutlet weak var categorySettingsConainerView: UIView!
    @IBOutlet weak var categoryContainerView: UIView!
    
    // MARK: - Properties(Private)
    
    private var canvasContainerView: CanvasContainerView!
    private var canvasRendererView: CanvasRendererView!
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
        configureCanvas()
        configureScrollView()
        configureColorPicker()
        configureDropInteraction()
    }
    
    private func configureCanvas() {
        let screenSize = UIScreen.main.bounds.size
        let minDimension = min(screenSize.width, screenSize.height)
        let maxDimension = max(screenSize.width, screenSize.height)
        let canvasSize = CGSize(width: maxDimension, height: minDimension)
        
        self.canvasRendererView = CanvasRendererView()
        self.canvasContainerView = CanvasContainerView(canvasSize: canvasSize)
        self.canvasContainerView.documentView = canvasRendererView
    }
    
    private func configureScrollView() {
        CanvasScrollView.Configurator(canvasScrollView: self.canvasScrollView)
            .contentView(canvasContainerView)
            .contentSize(canvasContainerView.bounds.size)
            .zoom()
            .scrollViewBackgroundColor(.darkGray)
    }
    
    private func configureColorPicker() {
        colorPicker.delegate = self
    }
    
    private func configureDropInteraction() {
//        canvasDropInteractor = CanvasViewDropInteractor(parentView: self.view, scrollView: scrollView)
//        canvasDropInteractor.delegate = self
//        canvasDropInteractor.configure()
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
//        self.scrollView.addSubview(shapeView)
        
        presenter?.handleShapeDrop(shapeType: shapeType, style: style, atLocation: dropCenter, size: shapeFrame.size)
    }
}

extension CanvasViewController: CanvasView {
    func displayShapes(_ shapeViewModels: [Canvas.ShapeView]) {
        self.canvasRendererView.drawingCommands = shapeViewModels
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
