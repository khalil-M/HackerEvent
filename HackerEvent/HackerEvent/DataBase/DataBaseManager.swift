//
//  DataBaseManager.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 10/2/2023.
//

import Foundation

protocol DataManagerProtocol {
    func retrieveEvents() -> [Event]
    func saveEvent(name: String)
}

//extension DataManagerProtocol {
//    func retrieveTodos(includingCompleted: Bool = false) -> [Event] {
//        retrieveTodos(includingCompleted: includingCompleted)
//    }
//}

class DataManager {
    static let shared: DataManagerProtocol = DataManager()
    var dbService: CoreDataService = CoreDataService.shared
    
    private var events = [Event]()
    
    private func addToEntity(for event: Event) {
        let entity = EventEntity.entity()
        let newEvent = EventEntity(entity: entity, insertInto: dbService.context)
        newEvent.name = event.name
        newEvent.url = event.url
        newEvent.startTime = event.start_time
        newEvent.endTime = event.end_time
        newEvent.duration = event.duration
        newEvent.site = event.site
        newEvent.in_24_hours = event.in_24_hours
        newEvent.status = event.status
    }
}


extension DataManager: DataManagerProtocol {
    
    func retrieveEvents() -> [Event] {
        let result: Result<[EventEntity], Error> = dbService.retrieve(EventEntity.self)
        switch result {
        case .success(let eventEntities):
            return eventEntities.map { $0.convertToEvent()}
        case .failure(let error):
            fatalError(error.localizedDescription)
        }
    }
    
    func saveEvent(name: String) {
        let entity = EventEntity.entity()
        let newEvent = EventEntity(entity: entity, insertInto: dbService.context)
        newEvent.name = name
        dbService.create(newEvent)
    }
 
}
