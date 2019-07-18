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
    
    @IBAction func addButtonTouchAction(_ sender: UIBarButtonItem) {
        let doneClosure = { [unowned self] (canvasName: String) in
            let canvas = CanvasModel(name: canvasName)
            self.canvasListView.addCanvas(canvas)
        }
        
        let addCanvasAlert = UIAlertController.makeAddCanvasAlert(doneActionHandler: doneClosure,
                                                                  cancelActionHandler: { print("Cancel Tapped") })
        self.present(addCanvasAlert, animated: true, completion: nil)
    }
}
