//
//  EventEntity+CoreDataProperties.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 10/2/2023.
//
//

import Foundation
import CoreData

//@objc(EventEntity)
extension EventEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventEntity> {
        return NSFetchRequest<EventEntity>(entityName: "EventEntity")
    }
    @NSManaged public var name: String?
    @NSManaged public var url: String?
    @NSManaged public var startTime: String?
    @NSManaged public var endTime: String?
    @NSManaged public var duration: String?
    @NSManaged public var site: String?
    @NSManaged public var in_24_hours: String?
    @NSManaged public var status: String?

}

extension EventEntity : Identifiable {
    func convertToEvent() -> Event {
        Event(name: name!, url: url ?? "", start_time: startTime ?? "", end_time: endTime ?? "", duration: duration ?? "", site: site ?? "", in_24_hours: in_24_hours ?? "", status: status ?? "")
    }

}
