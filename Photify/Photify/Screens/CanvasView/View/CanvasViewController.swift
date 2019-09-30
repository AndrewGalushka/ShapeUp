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
    
    weak var presenter: CanvasPresenterInput?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        self.presenter?.viewLoaded()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        canvasScrollView.zoomToFit(animated: false, edgeInset: 5)
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
            .contentSize(canvasContainerView.bounds.size)
            .contentView(canvasContainerView)
            .zoomMinMaxScale()
            .scrollViewBackgroundColor(.darkGray)
    }
        
    private func configureColorPicker() {
        colorPicker.delegate = self
    }
    
    private func configureDropInteraction() {
        canvasDropInteractor = CanvasViewDropInteractor(targetView: self.canvasRendererView)
        canvasDropInteractor.delegate = self
    }
}

extension CanvasViewController: CanvasViewDropInteractorDelegate {
    func canvasDropInteractor(_ dropInteractor: CanvasViewDropInteractor,
                              dropShapeType shapeType: ShapeType,
                              style: ShapeStyle,
                              atLocation dropCenter: CGPoint) {
        presenter?.handleShapeDrop(shapeType: shapeType, style: style, atLocation: dropCenter, size: Self.predefinedShapeViewSize)
    }
}

extension CanvasViewController: CanvasViewInput {
    func addShapeToDisplay(_ shapeViewModel: Canvas.ShapeView) {
        self.canvasRendererView.addShape(shapeViewModel)
    }
    
    func displayShapes(_ shapeViewModels: [Canvas.ShapeView]) {
        self.canvasRendererView.setShapes(shapeViewModels)
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

extension CanvasViewController {
    static var predefinedShapeViewSize = CGSize(width: 72, height: 72)
}
