//
//  StorageModelsTranslator+Color.swift
//  Photify
//
//  Created by Galushka on 8/7/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import DataStorage

extension StorageModelsTranslator: ColorMapable {
    func translate(color: Color) -> ColorDTO {
        return ColorDTO(red: color.red,
                        green: color.green,
                        blue: color.blue,
                        alpha: color.alpha)
    }
    
    func translate(colorDTO: ColorDTO) -> Color {
        return Color(red: colorDTO.red,
                     green: colorDTO.green,
                     blue: colorDTO.blue,
                     alpha: colorDTO.alpha)
    }
}
