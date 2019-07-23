//
//  CanvasModule.swift
//  Photify
//
//  Created by Galushka on 7/23/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class CanvasModule: ViewControllerBasedModule {
    let view: CanvasViewController
    let presenter: CanvasPresenter
    
    weak var output: CanvasModuleOutput?
    
    init(view: CanvasViewController, presenter: CanvasPresenter) {
        self.view = view
        self.presenter = presenter
        
        self.view.presenter = self.presenter
        self.presenter.view = self.view
        self.presenter.output = self
    }
    
    var asViewController: UIViewController {
        return view
    }
}

extension CanvasModule: CanvasPresenterOutput {
    
}
