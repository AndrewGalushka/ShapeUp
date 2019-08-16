//
//  PersistentContainer.swift
//  Photify
//
//  Created by Galushka on 7/9/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import CoreData

final class PersistentContainer: NSPersistentContainer {
    
    func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
        let context = backgroundContext ?? viewContext
        
        // performAndWait or perform - is thread save approach as mensioned on
        // https://developer.apple.com/documentation/coredata/setting_up_a_core_data_stack/setting_up_a_core_data_stack_manually
        
        guard context.hasChanges else {
            return
        }
        
        do {
            try context.save()
        } catch let error as NSError {
            debugPrint("SaveContext Error: \(error), \(error.userInfo)")
        }
    }
}
