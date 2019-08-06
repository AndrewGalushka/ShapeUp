//
//  Grid.swift
//  Photify
//
//  Created by Galushka on 8/5/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

import CoreGraphics

struct Grid: Shape {
    let epsilon = 10
    
    func path(in rect: CGRect) -> CGPath {
        let canvasSize = rect.size
        
        let xStepLength = rect.size.width / CGFloat(epsilon)
        let yStepLength = rect.size.height / CGFloat(epsilon)
        
        let path = CGMutablePath()
        
        for i in 0...epsilon {
            let topPoint = CGPoint(x: xStepLength * CGFloat(i),
                                   y: 0)
            let bottomPoint = CGPoint(x: xStepLength * CGFloat(i),
                                      y: canvasSize.height)
            
            path.addLines(between: [topPoint, bottomPoint])
        }
        
        for i in 0...epsilon {
            let leftPoint = CGPoint(x: 0,
                                    y: yStepLength * CGFloat(i))
            let rightPoint = CGPoint(x: canvasSize.width,
                                     y: yStepLength * CGFloat(i))
            
            path.addLines(between: [leftPoint, rightPoint])
        }
        
        return path
    }
}
