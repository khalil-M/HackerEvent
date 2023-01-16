//
//  EventListRouter.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 16/1/2023.
//

import Foundation
import UIKit

class EventListRouter: EventListRouting {
    
    var navigationController: UINavigationController?
    
    func routeToEventDetails(for event: Event) {
        let vc = AppDependencies.shared.makeDetailEventViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }

    
}
