//
//  MainScreenViewController.swift
//  Photify
//
//  Created by Galushka on 7/10/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    private func setupUI() {
        
        let goToButton = UIButton(type: .system)
        goToButton.setTitle("GO!", for: .normal)
        goToButton.titleLabel?.font = UIFont.systemFont(ofSize: 60)
        goToButton.alpha = 0.0
        self.view.addSubview(goToButton)
        goToButton.translatesAutoresizingMaskIntoConstraints = false
        goToButton.widthAnchor.constraint(equalToConstant: 400).isActive = true
        goToButton.heightAnchor.constraint(equalToConstant: 400).isActive = true
        goToButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        goToButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        goToButton.addTarget(self, action: #selector(goToButtonTouchUpInside(_:)), for: .touchUpInside)
        
        UIView.animate(withDuration: 2.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            goToButton.alpha = 1.0
        })
    }
    
    @objc private func goToButtonTouchUpInside(_ sender: UIButton) {
        let shapesCanvasVC = CanvasViewController.loadFromStoryboard()
        self.navigationController?.pushViewController(shapesCanvasVC, animated: true)
    }
}
