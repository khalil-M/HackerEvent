//
//  CoreDataService.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 10/2/2023.
//

import Foundation
import CoreData

class CoreDataService: DBServiceProtocol {
    
    static let shared = CoreDataService()
    
    typealias ObjectType = NSManagedObject
    typealias PredicateType = NSPredicate
    
    // MARK: - Core Data
    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: "EventEntity")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext { persistentContainer.viewContext }
    
    func create(_ object: NSManagedObject) {
        do {
            try context.save()
        } catch {
            fatalError("error saving context while creating an object")
        }
    }
    
    func retrieve<T: NSManagedObject>(_ objectType: T.Type) -> Result<[T], Error> {
        let request = objectType.fetchRequest()
        do {
            let result = try context.fetch(request)
            return .success(result as? [T] ?? [])
        } catch {
            return .failure(error)
        }
    }
    
    
    func retrieveFirst<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate?) -> Result<T?, Error> {
        let request = objectType.fetchRequest()
        request.predicate = predicate
        request.fetchLimit = 1
        do {
            let result = try context.fetch(request) as? [T]
            return .success(result?.first)
        } catch {
            return .failure(error)
        }
    }
    
    func update(_ object: NSManagedObject) {
        do {
            try context.save()
        } catch {
            fatalError("error saving context while updating an object")
        }
    }
    
    func delete(_ object: NSManagedObject) {
        context.delete(object)
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchEventsFromDB<T: NSManagedObject>(_ objectType: T.Type) -> Result<[NSManagedObject], Error> {
        let request = objectType.fetchRequest()
        request.fetchLimit = 1
        do {
            let result = (try context.fetch(request) as? [ObjectType])!
            return .success((result))
        } catch {
            return .failure(error)
        }
    }
    
    
//    func getAllOverviewCategories() -> [PFOverviewItem] {
//        let context = self.persistentContainer.viewContext
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PFOverviewItem")
//        do {
//            let requestResult = try context.fetch(request) as? [PFOverviewItem]
//            return requestResult!
//        } catch {
//            print("Failed to fetch contents: \(error)")
//            // fatalError("Failed to fetch chapters: \(error)")
//        }
//        return []
//    }
}
