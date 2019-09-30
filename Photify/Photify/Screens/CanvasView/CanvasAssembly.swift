//
//  CanvasAssembly.swift
//  Photify
//
//  Created by Galushka on 7/23/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class CanvasAssembly: AssemblyType {
    let interactor: CanvasInteractorInput
    let presenter: CanvasPresenterInput
    let view: CanvasViewController
    
    weak var output: CanvasModuleOutput?
    
    init(interactor: CanvasInteractorInput, presenter: CanvasPresenterInput, view: CanvasViewController) {
        self.interactor = interactor
        self.presenter = presenter
        self.view = view
    }
    
    var asViewController: UIViewController {
        return view
    }
}

extension CanvasAssembly: CanvasPresenterOutput {
}

protocol AssemblyType: ViewControllerBasedModule {
    var output: CanvasModuleOutput? { get set }
}


