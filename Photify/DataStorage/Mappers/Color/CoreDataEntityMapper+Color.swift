//
//  CoreDataEntityMapper+Color.swift
//  DataStorage
//
//  Created by Galushka on 8/6/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

extension CoreDataEntityMapper: ColorMapable {
    func translate(color: Color) -> ColorDTO {
        return ColorDTO(red: color.red, green: color.green, blue: color.blue, alpha: color.alpha)
    }
    
    func translate(colorDTO: ColorDTO, moc: NSManagedObjectContext) -> Color {
        let color = Color(context: moc)
        color.red = colorDTO.red
        color.green = colorDTO.green
        color.blue = colorDTO.blue
        color.alpha = colorDTO.alpha
        
        return color
    }
}
