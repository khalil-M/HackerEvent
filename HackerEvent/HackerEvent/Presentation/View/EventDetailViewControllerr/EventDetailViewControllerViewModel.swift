//
//  EventDetailViewControllerViewModel.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 10/2/2023.
//

import Foundation

class EventDetailViewControllerViewModel {
    
    let event: Event
    var dataManager: DataManagerProtocol
    
    init(event: Event, dataManager: DataManagerProtocol = DataManager.shared) {
        self.event = event
        self.dataManager = dataManager
    }

    
    func saveEvent(title: String) {
        dataManager.addEvent(name: title)
    }
    
}
