//
//  DataBaseManager.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 10/2/2023.
//

import Foundation

protocol DataManagerProtocol {
    func retrieveEvents(includingCompleted: Bool) -> [Event]
    func addEvent(name: String)
}

extension DataManagerProtocol {
    func retrieveTodos(includingCompleted: Bool = false) -> [Event] {
        retrieveTodos(includingCompleted: includingCompleted)
    }
}

class DataManager {
    static let shared: DataManagerProtocol = DataManager()
    var dbService: CoreDataService = CoreDataService.shared
}


extension DataManager: DataManagerProtocol {
    
    func retrieveEvents(includingCompleted: Bool) -> [Event] {
        let predicate = includingCompleted ? nil : NSPredicate(format: "isCompletd == false")
        let result: Result<[EventEntity], Error> = dbService.retrieve(EventEntity.self, predicate: predicate)
        switch result {
        case .success(let eventEntities):
            return eventEntities.map { $0.convertToEvent()}
        case .failure(let error):
            fatalError(error.localizedDescription)
        }
    }
    
    func addEvent(name: String) {
        let entity = EventEntity.entity()
        let newEvent = EventEntity(entity: entity, insertInto: dbService.context)
        newEvent.name = name
        dbService.create(newEvent)
    }
 
}
