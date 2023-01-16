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
    
//    func formatterDate(isoDate: String) {
//        isoDate = "2016-04-14T10:44:00+0000"
//
//          let dateFormatter = DateFormatter()
//          dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
//          dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//          let date = dateFormatter.date(from:isoDate)!
//
//
//    }
  
}
