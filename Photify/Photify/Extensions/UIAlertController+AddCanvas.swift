//
//  UIAlertController+AddCanvas.swift
//  Photify
//
//  Created by Galushka on 7/18/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit.UIAlertController

extension UIAlertController {
    static func makeAddCanvasAlert(doneActionHandler doneHandler: @escaping (_: String) -> Void,
                                   cancelActionHandler cancelHandler: @escaping () -> Void) -> UIAlertController {
        let alertController = UIAlertController(title: "New Canvas",
                                                message: nil,
                                                preferredStyle: .alert)
        
        alertController.addTextField { (canvasNameTextField) in
            canvasNameTextField.tag = -90
            canvasNameTextField.placeholder = "Enter Canvas Name"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in cancelHandler() })
        let doneAction = UIAlertAction(title: "Done", style: .default, handler: { (action) in
            guard let canvasNameTextField = (alertController.textFields?.first { $0.tag == -90 }) else {
                doneHandler("")
                return
            }
            
            var canvasName = "unnamed"
            
            if let textFieldText = canvasNameTextField.text, !textFieldText.isEmpty {
                canvasName = textFieldText
            }
            
            doneHandler(canvasName)
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(doneAction)
        
        return alertController
    }
}
