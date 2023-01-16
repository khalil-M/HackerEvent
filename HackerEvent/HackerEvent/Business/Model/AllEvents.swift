//
//  AllEvents.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 15/1/2023.
//

import Foundation

public struct AllEvents: DTO {
    public var items: [Event]

    public var errorMessage: String
    
    public var description: String {
        return """
        ------------
        items = \(items)
        errorMessage = \(errorMessage)
        ------------
        """
    }
}

