//
//  DBServiceProtocol.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 10/2/2023.
//

import Foundation

public protocol DBServiceProtocol {
    
    associatedtype ObjectType
    associatedtype PredicateType
    
    func create(_ object: ObjectType)
    func retrieveFirst(_ objectType: ObjectType.Type, predicate: PredicateType?) -> Result<ObjectType?, Error>
    func retrieve(_ objectType: ObjectType.Type) -> Result<[ObjectType], Error>
    func update(_ object: ObjectType)
    func delete(_ object: ObjectType)
    func fetchEventsFromDB(_ objectType: ObjectType.Type) -> Result<[ObjectType], Error>
}

public extension DBServiceProtocol {
    func retrieve(_ objectType: ObjectType.Type) -> Result<[ObjectType], Error> {
        return retrieve(objectType)
    }
}

