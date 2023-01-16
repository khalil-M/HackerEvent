//
//  Rooting.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 16/1/2023.
//

import Foundation
import UIKit

protocol Routing {
    var navigationController: UINavigationController? { set get }
}

// Routes

// routeToEventDetails

protocol EventListRouting: Routing {
    func routeToEventDetails(for event: Event)
}


