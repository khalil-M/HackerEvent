//
//  Event.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 14/1/2023.
//


import Foundation
public struct Event: DTO {
    
    
    public var name:                     String
    public var url:                      String
    public var start_time:               String
    public var end_time:                 String
    public var duration:                 String
    public var site:                     String
    public var in_24_hours:              String
    public var status:                   String
    
    public var description: String {
        return """
        ------------
        name = \(name)
        url = \(url)
        start_time = \(start_time)
        end_time = \(end_time)
        duration = \(duration)
        site = \(site)
        in_24_hours = \(in_24_hours)
        status = \(status)
        ------------
        """
    }
}


