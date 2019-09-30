//
//  CanvasListAssembly.swift
//  Photify
//
//  Created by Galushka on 7/19/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class CanvasListAssembly: ViewControllerBasedModule {
    let view: CanvasListViewController
    let presenter: CanvasesListPresenter
    
    weak var output: CanvasListModuleOutput?
    
    init(view: CanvasListViewController, presenter: CanvasesListPresenter) {
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

extension CanvasListAssembly: CanvasesListPresenterOutput {
    func didTapOnCanvas(_ canvas: Canvas) {
        output?.didTapOnCanvas(canvas)
    }
}
