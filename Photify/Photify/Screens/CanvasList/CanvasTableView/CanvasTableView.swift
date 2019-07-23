//
//  CanvasListTableView.swift
//  Photify
//
//  Created by Galushka on 7/15/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import UIKit

@IBDesignable
class CanvasTableView: UIView {
    
    // MASK: - Properties(Private)
    
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
    
    // MARK: - Properties(Public)
    
    weak var delegate: CanvasTableViewDelegate?
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    // MARK: - Methods(Public)
    
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
    
    // MARK: - Methods(Private)
    
    private func setUp() {
        tableView.backgroundColor = .red
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension CanvasTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .blue
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = dataSource[indexPath.row].name
        
        return cell
    }
}

extension CanvasTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let selectedCanvas = dataSource.item(at: indexPath.row) else { return }
        delegate?.canvasTableView(self, didSelectCanvas: selectedCanvas)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.delegate?.canvasTableView(self, deleteCanvas: dataSource[indexPath.row])
        }
    }
}
