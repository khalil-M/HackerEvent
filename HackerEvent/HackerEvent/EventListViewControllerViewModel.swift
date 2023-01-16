//
//  EventListViewControllerViewModel.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 15/1/2023.
//

import Foundation

class EventListViewControllerViewModel {
    
    ///vars
    private var manager: EventManagerProtocol
    
    public var allEvents: [Event] = []
    
    var reloadCollectionView: () -> Void = { }
    // MARK: - Init
    init(manager: EventManagerProtocol) {
        self.manager = manager
    }
    
    
    public func getData() {
        manager.getAllEvents { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.allEvents = response
                    break
                case .failure(let error):
                    print("Failed to fetch all events\(error)")
                }
            }
        }
    }
    
}
