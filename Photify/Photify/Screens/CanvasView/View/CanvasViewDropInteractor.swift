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
    
    unowned let parentView: UIView
    unowned let scrollView: UIView
    
    // MARK: - Properties(Private)
    
    private var dropInteraction: UIDropInteraction?
    
    // MARK: - Initializers
    
    init(parentView: UIView, scrollView: UIView) {
        self.parentView = parentView
        self.scrollView = scrollView
    }
    
    // MARK: - Methods(Public)
    
    func configure() {
        
        if dropInteraction == nil {
            dropInteraction = UIDropInteraction(delegate: self)
        }
        
        parentView.addInteraction(dropInteraction!)
    }
    
    // MARK: - UIDropInteractionDelegate Imp
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: UIImage.self) && session.items.count == 1
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidEnter session: UIDropSession) {
        let location = session.location(in: parentView)
        
        if self.scrollView.frame.contains(location) {
            self.scrollView.layer.borderWidth = 3
            self.scrollView.layer.borderColor = UIColor.darkGray.withAlphaComponent(0.5).cgColor
        }
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        let location = session.location(in: self.scrollView)
        
        let dropOperation: UIDropOperation
        
        if self.scrollView.frame.contains(location) {
            self.scrollView.layer.borderWidth = 3
            self.scrollView.layer.borderColor = UIColor.darkGray.withAlphaComponent(0.5).cgColor
            
            dropOperation = .copy
        } else {
            self.scrollView.layer.borderWidth = 0.0
            self.scrollView.layer.borderColor = nil
            
            dropOperation = .cancel
        }
        
        let dropProposal = UIDropProposal(operation: dropOperation)
        dropProposal.isPrecise = true
        return UIDropProposal(operation: dropOperation)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        guard let (shape, shapeStyle) = session.items.first?.localObject as? (Shape, ShapeStyle) else { return }
        let dropLocation = session.location(in: self.scrollView)
        
        
        
        let shapeView = ShapeView(shape: AnyShape(shape: shape),
                                  frame: CGRect(center: dropLocation, size: .init(width: 72, height: 72)))
        shapeView.shapeLayer.configure(shapeStyle: shapeStyle)
        
        shapeView.alpha = 0.0
        self.scrollView.addSubview(shapeView)
        
        UIView.animate(withDuration: 0.25) {
            shapeView.alpha = 1.0
        }
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidEnd session: UIDropSession) {
        self.scrollView.layer.borderWidth = 0.0
        self.scrollView.layer.borderColor = nil
    }
}
