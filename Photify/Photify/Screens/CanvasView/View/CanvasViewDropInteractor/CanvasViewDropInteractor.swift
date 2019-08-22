//
//  CanvasViewDropInteractor.swift
//  Photify
//
//  Created by Galushka on 7/30/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit


class CanvasViewDropInteractor: NSObject, UIDropInteractionDelegate {
    
    // MARK: - Properties(Public)
    
    unowned let targetView: UIView
    
    weak var delegate: CanvasViewDropInteractorDelegate?
    
    // MARK: - Properties(Private)
    
    private var dropInteraction: UIDropInteraction?
    
    // MARK: - Initializers
    
    init(targetView: UIView) {
        self.targetView = targetView
    }
    
    // MARK: - Methods(Public)
    
    func configure() {
        
        if dropInteraction == nil {
            dropInteraction = UIDropInteraction(delegate: self)
        }
        
        targetView.addInteraction(dropInteraction!)
    }
    
    // MARK: - UIDropInteractionDelegate Imp
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: UIImage.self) && session.items.count == 1
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidEnter session: UIDropSession) {
        let location = session.location(in: targetView)
        
        if targetView.frame.contains(location) {
            targetView.layer.borderWidth = 3
            targetView.layer.borderColor = UIColor.darkGray.withAlphaComponent(0.5).cgColor
        }
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        let location = session.location(in: targetView)
        
        let dropOperation: UIDropOperation
        
        if targetView.point(inside: location, with: nil) {
            targetView.layer.borderWidth = 3
            targetView.layer.borderColor = UIColor.darkGray.withAlphaComponent(0.5).cgColor
            
            dropOperation = .copy
        } else {
            targetView.layer.borderWidth = 0.0
            targetView.layer.borderColor = nil
            
            dropOperation = .cancel
        }
        
        let dropProposal = UIDropProposal(operation: dropOperation)
        dropProposal.isPrecise = true
        return UIDropProposal(operation: dropOperation)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        guard let shapeInfo = session.items.first?.localObject as? ShapesDragAndDropDTO else { return }
        let dropLocation = session.location(in: targetView)
        
        delegate?.canvasDropInteractor(self, dropShapeType: shapeInfo.shapeType, style: shapeInfo.shapeStyle, atLocation: dropLocation)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, concludeDrop session: UIDropSession) {
        targetView.layer.borderWidth = 0.0
        targetView.layer.borderColor = nil
    }
}
