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
    
    private var dataSource = [Canvas]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func replaceExistingCanases(with canvases: [Canvas]) {
        dataSource = canvases
        tableView.reloadData()
    }
    
    func addCanvas(_ canvas: Canvas) {
        self.addCanvases([canvas])
    }
    
    func addCanvases(_ canvases: [Canvas]) {
        dataSource.append(contentsOf: canvases)
        tableView.reloadData()
    }
    
    private func setUp() {
        tableView.backgroundColor = .red
        tableView.dataSource = self
    }
}

extension CanvasListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dataSource[indexPath.row].name
        
        return cell
    }
}
