//
//  CanvasListViewController.swift
//  Photify
//
//  Created by Galushka on 7/15/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class CanvasListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var canvasTableView: CanvasTableView!
    
    // MARK: - Properties(Private)
    
    weak var presenter: CanvasesListPresenterProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        self.presenter?.viewLoaded()
    }
    
    // MARK: - IBActions
    
    @IBAction func addNavigationButtonTapActionHandler(_ sender: UIBarButtonItem) {
        let doneClosure = { [unowned self] (canvasName: String) -> Void in
            self.presenter?.addCanvasPressed(name: canvasName)
        }
        
        let addCanvasAlert = UIAlertController.makeAddCanvasAlert(doneActionHandler: doneClosure,
                                                                  cancelActionHandler: { print("Cancel Tapped") })
        self.present(addCanvasAlert, animated: true, completion: nil)
    }
    
    @IBAction func saveNavigationButtonTapActionHandler(_ sender: Any) {
        self.presenter?.didTapSaveCanvases()
    }
    
    // MARK: Methods(Private)
    
    private func setup() {
        self.canvasTableView.delegate = self
    }
}

extension CanvasListViewController: CanvasTableViewDelegate {
    func canvasTableView(_ canvasTableView: CanvasTableView, didSelectCanvas selectedCanvas: Canvas) {
        self.presenter?.didTapOnCanvas(selectedCanvas)
    }
    
    func canvasTableView(_ canvasTableView: CanvasTableView, deleteCanvas canvasToDelete: Canvas) {
        self.presenter?.removeCanvasPressed(canavas: canvasToDelete)
    }
}

extension CanvasListViewController: CanvasListView {
    func displayCanvases(_ canvases: [Canvas]) {
        self.canvasTableView.replaceExistingCanases(with: canvases)
    }
}
