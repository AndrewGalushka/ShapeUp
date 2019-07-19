//
//  CanvasListViewController.swift
//  Photify
//
//  Created by Galushka on 7/15/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class CanvasListViewController: UIViewController {
    @IBOutlet weak var canvasListView: CanvasListView!
    weak var storageManager: StorageManagerType?
    
    var savedCanvases: [Canvas] = [Canvas]()
    var newCanvases: [Canvas] = [Canvas]()
    var canvases: [Canvas] {
        return savedCanvases + newCanvases
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCanvases()
    }
    
    @IBAction func addNavigationButtonTapActionHandler(_ sender: UIBarButtonItem) {
        let doneClosure = { [unowned self] (canvasName: String) in
            let canvas = CanvasModel(name: canvasName)
            self.newCanvases.append(canvas)
            self.canvasListView.replaceExistingCanases(with: self.canvases)
        }
        
        let addCanvasAlert = UIAlertController.makeAddCanvasAlert(doneActionHandler: doneClosure,
                                                                  cancelActionHandler: { print("Cancel Tapped") })
        self.present(addCanvasAlert, animated: true, completion: nil)
    }
    
    func updateCanvases() {
        if let canvases = storageManager?.fetchAllCanvases() {
            self.savedCanvases = canvases
            self.newCanvases.removeAll()
            canvasListView.replaceExistingCanases(with: canvases)
        }
    }
    
    @IBAction func saveNavigationButtonTapActionHandler(_ sender: Any) {
        guard !newCanvases.isEmpty else { return }
        
        storageManager?.saveCanvases(self.newCanvases)
        self.savedCanvases.append(contentsOf: newCanvases)
        self.newCanvases.removeAll()
    }
}
