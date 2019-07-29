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
    
    // MARK: - Properties(Public)
    
    weak var presenter: CanvasPresenterProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        self.presenter?.viewLoaded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let rectangle = ShapeView(shape: Rectangle(), frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.scrollView.addSubview(rectangle)
        
        let hexagon = ShapeView(shape: Hexagon())
        hexagon.frame = CGRect(x: 100, y: 300, width: 200, height: 100)
        hexagon.layer.borderWidth = 1.0
        self.scrollView.addSubview(hexagon)
        
        let circle = ShapeView(shape: Circle())
        circle.frame = CGRect(x: 100, y: 300, width: 200, height: 100)
        circle.fillColor = nil
        circle.lineWidth = 1.0
        circle.shapeLayer.strokeColor = UIColor.blue.cgColor
        self.scrollView.addSubview(circle)
        
        let ellipse = ShapeView(shape: Ellipse())
        ellipse.frame = CGRect(x: 100, y: 600, width: 300, height: 100)
        self.scrollView.addSubview(ellipse)
        
        let triangle = ShapeView(shape: Triangle(), frame: CGRect(x: 300, y: 100, width: 100, height: 100))
        self.scrollView.addSubview(triangle)
        
        let star = ShapeView(shape: Star())
        star.frame = CGRect(origin: view.center, size: CGSize(width: 300, height: 300))
        self.scrollView.addSubview(star)
        
        let starCircle = ShapeView(shape: Circle())
        starCircle.frame = CGRect(origin: view.center, size: CGSize(width: 300, height: 300))
        starCircle.fillColor = nil
        starCircle.lineWidth = 1.0
        starCircle.shapeLayer.strokeColor = UIColor.blue.cgColor
        self.scrollView.addSubview(starCircle)
        
        let xMark = ShapeView(shape: XMark())
        xMark.frame = CGRect(x: view.center.x, y: 10, width: 100, height: 100)
        xMark.shapeLayer.fillColor = UIColor.red.cgColor
        xMark.layer.borderWidth = 1.0
        self.scrollView.addSubview(xMark)
    }
    
    // MARK: - Methods(Private)
    
    private func setup() {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        colorPicker.delegate = self
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

