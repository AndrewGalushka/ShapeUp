//
//  CoreDataManagerAdapter+ShapeViewsStorable.swift
//  DataStorage
//
//  Created by Galushka on 8/6/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

extension CoreDataManagerAdapter: CanvasShapeViewsStorable {
    func fetchAllShapesViews(inside canvas: CanvasDTO) -> CanvasDTO? {
        let request: NSFetchRequest<ShapeView> = ShapeView.fetchRequest()
        request.predicate = NSPredicate(format: "%K.%K == %@",
                                        #keyPath(ShapeView.canvas),
                                        #keyPath(ShapeView.canvas.identifier),
                                        canvas.identifier as CVarArg)
        
        do {
            let shapeViews = try self.coreDataManager.fetch(by: request)
            
            var updatedCanvasDTO = canvas
            updatedCanvasDTO.shapes = self.mapper.translate(shapeViews: shapeViews)
            
            return updatedCanvasDTO
            
        } catch let error as NSError {
            print("[fetchAllShapesViews(inside: CanvasDTO)] Error: \(error)")
            return nil
        }
    }
    
    func fetchAllShapesViews(inside canvasWithID: UUID) -> CanvasDTO? {
        let request: NSFetchRequest<Canvas> = Canvas.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@",
                                        #keyPath(Canvas.identifier),
                                        canvasWithID as CVarArg)
        
        do {
            guard let canvas = try self.coreDataManager.fetch(by: request).first else {
                return nil
            }
            
            let canvasDTO = self.mapper.translate(canvas: canvas)
            return canvasDTO
            
        } catch let error as NSError {
            print("[fetchAllShapesViews(inside: UUID] Error: \(error)")
            return nil
        }
    }
    
    func addShapesViews(_ shapeViewDTOs: [ShapeViewDTO], to canvas: CanvasDTO) -> CanvasDTO? {
        
        do {
            let canvasFetchRequest: NSFetchRequest<Canvas> = Canvas.fetchRequest()
            canvasFetchRequest.predicate = NSPredicate(format: "%K == %@",
                                                       #keyPath(Canvas.identifier),
                                                       canvas.identifier as CVarArg)
            
            guard let fetchedCanvas = try self.coreDataManager.fetch(by: canvasFetchRequest).first else {
                return nil
            }
            
            let shapes = self.mapper.translate(shapeViewsDTOs: shapeViewDTOs, moc: self.coreDataManager.mainContext())
            let shapesSet = NSSet(array: shapes)
            
            fetchedCanvas.addToShapes(shapesSet)
            
            let updatedCanvasDTO = self.mapper.translate(canvas: fetchedCanvas)
            return updatedCanvasDTO
            
        } catch let error as NSError {
            print("[addShapesViews([ShapeViewDTO], CanvasDTO)] Error: \(error)")
            return nil
        }
        
        
    }
}
