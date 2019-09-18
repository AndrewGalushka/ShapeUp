//
//  DrawingCommand.swift
//  Photify
//
//  Created by Galushka on 9/17/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

protocol DrawingCommand {
    func draw(in rect: CGRect)
}

class CompositeDrawingCommand: DrawingCommand {
    var commands: [DrawingCommand]
    
    init(commands: [DrawingCommand]) {
        self.commands = commands
    }
    
    func draw(in rect: CGRect) {
        commands.forEach { $0.draw(in: rect) }
    }
}
