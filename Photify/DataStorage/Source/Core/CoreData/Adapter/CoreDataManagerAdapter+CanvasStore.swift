//
//  CoreDataManagerAdapter+CanvasStore.swift
//  DataStorage
//
//  Created by Galushka on 8/6/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

extension CoreDataManagerAdapter {
    func fetchAllCanvases() -> [CanvasDTO] {
        let fetchCanvasesRequest: NSFetchRequest<Canvas> = Canvas.fetchRequest()
        
        do {
            let canvases = try coreDataManager.fetch(fetchCanvasesRequest)
            let canvasesDTOs = mapper.translate(canvases: canvases)
            return canvasesDTOs
        } catch (let error as NSError) {
            print("fetchAllCanvases Error: \(error.localizedDescription)")
            return []
        }
    }
    
    func saveCanvases(_ canvases: [CanvasDTO]) {
        let canvases = mapper.translate(canvasesDTOs: canvases, moc: self.coreDataManager.mainContext())
        print(canvases)
        coreDataManager.save()
    }
    
    func deleteCanvases(identifiers: [UUID]) {
        let fetchRequest: NSFetchRequest<Canvas> = Canvas.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "%K in %@",
                                             #keyPath(Canvas.identifier),
                                             identifiers as CVarArg)
        
        do {
            let deletedObjectIDs = try coreDataManager.delete(fetchRequest)
            print("Deleted object ids \(deletedObjectIDs)")
            
            coreDataManager.save()
        } catch let error as NSError {
            print("Deleting error: \(error)")
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
     print("Deleted object ids \(deletedObjectIDs)")
     NSManagedObjectContext.mergeChanges(fromRemoteContextSave: [NSDeletedObjectsKey: deletedObjectIDs], into: [coreDataManager.mainContext()])
     }
     
     } catch (let error as NSError) {
     print("Deleting error: \(error)")
     }
     }
     */
}
