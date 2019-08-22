//
//  CenteredContentScrollView.swift
//  Photify
//
//  Created by Galushka on 8/21/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

class CenteredContentScrollView: UIScrollView {
    func centerContent() {
        var leftInset = CGFloat(0)
        var topInset = CGFloat(0)
        
        if self.contentSize.width < self.bounds.size.width {
            leftInset = (self.bounds.size.width - self.contentSize.width) * 0.5
        }
        
        if self.contentSize.height < self.bounds.size.height {
            topInset = (self.bounds.size.height - self.contentSize.height) * 0.5;
        }
        
        self.contentInset = .init(top: topInset, left: leftInset, bottom: topInset, right: leftInset)
    }
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        centerContent()
    }
    
    override var frame: CGRect {
        didSet {
            self.centerContent()
        }
    }
}
