//
//  ColorMapable.swift
//  Photify
//
//  Created by Galushka on 8/7/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import DataStorage

protocol ColorMapable {
    func translate(color: Color) -> ColorDTO
    func translate(colorDTO: ColorDTO) -> Color
    
    func translate(colors: [Color]) -> [ColorDTO]
    func translate(colorsDTOs: [ColorDTO]) -> [Color]
}

extension ColorMapable {
    func translate(colors: [Color]) -> [ColorDTO] {
        return colors.map {
            self.translate(color: $0)
        }
    }
    
    func translate(colorsDTOs: [ColorDTO]) -> [Color] {
        return colorsDTOs.map {
            self.translate(colorDTO: $0)
        }
    }
}
