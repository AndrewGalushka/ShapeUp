//
//  ViewController.swift
//  Photify
//
//  Created by Galushka on 7/8/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let rectangle = ShapeView(shape: Rectangle(), frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(rectangle)
        
        let hexagon = ShapeView(shape: Hexagon())
        hexagon.frame = CGRect(x: 100, y: 300, width: 200, height: 100)
        hexagon.layer.borderWidth = 1.0
        self.view.addSubview(hexagon)
        
        let circle = ShapeView(shape: Circle())
        circle.frame = CGRect(x: 100, y: 300, width: 200, height: 100)
        circle.fillColor = nil
        circle.lineWidth = 1.0
        circle.shapeLayer.strokeColor = UIColor.blue.cgColor
        self.view.addSubview(circle)
        
        let ellipse = ShapeView(shape: Ellipse())
        ellipse.frame = CGRect(x: 100, y: 600, width: 300, height: 100)
        self.view.addSubview(ellipse)
        
        let triangle = ShapeView(shape: Triangle(), frame: CGRect(x: 300, y: 100, width: 100, height: 100))
        self.view.addSubview(triangle)
    }
}

