//
//  AngleGeometry.swift
//  Photify
//
//  Created by Galushka on 7/8/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreGraphics

extension Geometry {
    
    struct Angle {
        private(set) var radians: Double
        private(set) var degrees: Double
        
        init(degrees: Double) {
            self.degrees = degrees
            self.radians = Angle.radiansFromDegrees(degrees)
        }
        
        init(radians: Double) {
            self.radians = radians
            self.degrees = Angle.degreesFromRadians(radians)
        }
        
        static func degrees(_ degrees: Double) -> Angle {
            return Angle(degrees: degrees)
        }
        
        static func radians(_ radians: Double) -> Angle {
            return Angle(radians: radians)
        }
        
        static func degreesFromRadians(_ radians: Double) -> Double {
            return radians * 180 / Double.pi
        }
        
        static func radiansFromDegrees(_ degrees: Double) -> Double {
            return degrees * Double.pi / 180
        }
    }
}
