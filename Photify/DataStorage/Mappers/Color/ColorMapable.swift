//
//  ColorMapable.swift
//  DataStorage
//
//  Created by Galushka on 8/6/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

protocol ColorMapable {
    func translate(color: Color) -> ColorDTO
    func translate(colorDTO: ColorDTO, moc: NSManagedObjectContext) -> Color
    
    func translate(colors: [Color]) -> [ColorDTO]
    func translate(colorsDTOs: [ColorDTO], moc: NSManagedObjectContext) -> [Color]
}

extension ColorMapable {
    func translate(colors: [Color]) -> [ColorDTO] {
        return colors.map {
            self.translate(color: $0)
        }
    }
    
    func translate(colorsDTOs: [ColorDTO], moc: NSManagedObjectContext) -> [Color] {
        return colorsDTOs.map {
            return translate(colorDTO: $0, moc: moc)
        }
    }
}

