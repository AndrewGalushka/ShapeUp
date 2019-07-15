//
//  CanvasListTableView.swift
//  Photify
//
//  Created by Galushka on 7/15/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

@IBDesignable
class CanvasListView: UIView {
    @IBInspectable private lazy var tableView: UITableView = {
        let tb = UITableView(frame: .zero)
        
        self.addSubview(tb)
        
        if self.translatesAutoresizingMaskIntoConstraints {
            tb.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        } else {
            tb.translatesAutoresizingMaskIntoConstraints = false
            tb.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            tb.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            tb.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            tb.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        }
        
        return tb
    }()
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
           return self.layer.cornerRadius
        }
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    private func setUp() {
        tableView.backgroundColor = .red
        tableView.dataSource = self
    }
}

extension CanvasListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
}
