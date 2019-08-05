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
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        scrollView.backgroundColor = .init(red: 239 / 255.0, green: 237 / 255.0, blue: 238 / 255.0, alpha: 1.0)
    }
    
    private func configureColorPicker() {
        colorPicker.delegate = self
    }
    
    private func configureDropInteraction() {
        canvasDropInteractor = CanvasViewDropInteractor(parentView: self.view, scrollView: scrollView)
        canvasDropInteractor.configure()
    }
}

extension CanvasViewController: CanvasView {
    func setTitleText(to text: String) {
        self.title = text
    }
}

extension CanvasViewController: ColorPickerDelegate {
    
    func colorPicker(_ colorPicker: ColorPicker, didPickColor pickedColor: Color?) {
        self.shapesCollectionView.changeShapesColors(to: pickedColor!)
    }
}
