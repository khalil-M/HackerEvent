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
    
    // vars
    public var cells: [CellViewProtocol] = []
    
    private var allEvents: [Event] = []
    
    var reloadTableView: () -> Void = { }
    
    var reloadCollectionView: () -> Void = { }
    // MARK: - Init
    init(manager: EventManagerProtocol) {
        self.manager = manager
    }
    
    var cellCount: Int {
        return cells.count
    }
    
    func itemAt(indexPath: IndexPath) -> CellViewProtocol {
        return cells[indexPath.row]
    }
    
    func getEventForIndexPath(indexPath: IndexPath) -> Event {
        return allEvents[indexPath.row]
    }
    
    
    public func getData() {
        manager.getAllEvents { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    let cellViewModels = response.map {
                        EventCellViewModel(name: $0.name, url: $0.url, start_time: $0.start_time, end_time: $0.end_time, duration: $0.duration, site: $0.site, in_24_hours: $0.in_24_hours, status: $0.status)
                    }
                    self?.cells = cellViewModels
                    self?.allEvents = response
                    self?.reloadTableView()
                    break
                case .failure(let error):
                    print("Failed to fetch all events\(error)")
                }
            }
        }
    }
    

    
}
