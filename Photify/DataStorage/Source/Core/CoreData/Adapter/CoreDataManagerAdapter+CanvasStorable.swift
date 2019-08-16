//
//  CoreDataManagerAdapter+CanvasStorable.swift
//  DataStorage
//
//  Created by Galushka on 8/6/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

extension CoreDataManagerAdapter: CanvasStorable {
    
    func fetchCanvasBy(ID: UUID) -> CanvasDTO? {
        let canvasByIDFetchRequest: NSFetchRequest<Canvas> = Canvas.fetchRequest()
        canvasByIDFetchRequest.fetchLimit = 1
        canvasByIDFetchRequest.predicate = NSPredicate(format: "%K == %@",
                                                       #keyPath(Canvas.identifier),
                                                       ID as CVarArg)
        
        do {
            guard let fetchedCanvas = try coreDataManager.fetch(by: canvasByIDFetchRequest).first else {
                return nil
            }
            
            return self.mapper.translate(canvas: fetchedCanvas)
            
        } catch let error as NSError {
            debugPrint("[fetchCanvasBy(ID: UUID)] Error: \(error)")
            return nil
        }
    }
    
    func fetchAllCanvases() -> [CanvasDTO] {
        let fetchCanvasesRequest: NSFetchRequest<Canvas> = Canvas.fetchRequest()
        
        do {
            let canvases = try coreDataManager.fetch(by: fetchCanvasesRequest)
            let canvasesDTOs = mapper.translate(canvases: canvases)
            return canvasesDTOs
        } catch (let error as NSError) {
            debugPrint("fetchAllCanvases Error: \(error.localizedDescription)")
            return []
        }
    }
    
    func saveCanvases(_ canvases: [CanvasDTO]) {
        let canvases = mapper.translate(canvasesDTOs: canvases, moc: self.coreDataManager.mainContext())
        debugPrint(canvases)
        coreDataManager.save()
    }
    
    func deleteCanvases(identifiers: [UUID]) {
        let fetchRequest: NSFetchRequest<Canvas> = Canvas.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "%K in %@",
                                             #keyPath(Canvas.identifier),
                                             identifiers as CVarArg)
        
        do {
            let deletedObjectIDs = try coreDataManager.delete(by: fetchRequest)
            debugPrint("Deleted object ids \(deletedObjectIDs)")
            
            coreDataManager.save()
        } catch let error as NSError {
            debugPrint("Deleting error: \(error)")
        }
    }
    
    /*
     func deleteCanvases(identifiers: [UUID]) {
     let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Canvas.fetchRequest()
     fetchRequest.predicate = NSPredicate(format: "%K in %@",
     #keyPath(Canvas.identifier),
     identifiers as CVarArg)
     
     let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
     deleteRequest.resultType = .resultTypeObjectIDs
     
     do {
     let result = try self.coreDataManager.mainContext().execute(deleteRequest) as? NSBatchDeleteResult
     let deletedObjectIDs = result?.result as? [NSManagedObjectID]
     
     if let deletedObjectIDs = deletedObjectIDs {
     debugPrint("Deleted object ids \(deletedObjectIDs)")
     NSManagedObjectContext.mergeChanges(fromRemoteContextSave: [NSDeletedObjectsKey: deletedObjectIDs], into: [coreDataManager.mainContext()])
     }
     
     } catch (let error as NSError) {
     debugPrint("Deleting error: \(error)")
     }
     }
     */
}
