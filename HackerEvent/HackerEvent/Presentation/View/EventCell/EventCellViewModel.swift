//
//  EventCellViewModel.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 16/1/2023.
//

import Foundation

struct EventCellViewModel : CellViewProtocol {
    var cellType: CellType = .eventCell
    
    public var name:                     String
    public var url:                      String
    public var start_time:               String
    public var end_time:                 String
    public var duration:                 String
    public var site:                     String
    public var in_24_hours:              String
    public var status:                   String
    
    func getDate(date: String) -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let result = dateFormatter.string(from: date)
        return result
    }
    
}
