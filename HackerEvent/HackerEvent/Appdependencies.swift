//
//  Appdependencies.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 13/1/2023.
//

import Foundation
import UIKit
class AppDependencies {
    var window: UIWindow?
    
    private init(){
        
    }
    
    private lazy var client: HTTPClient = {
        return URLSessionHTTPClient(session: URLSession.shared)
    }()
    
    private lazy var service: EventApiServiceProtocol = {
        return EventApiService(baseURL: URL(string:"https://kontests.net/api/v1")!, client: client)
    }()
    
    private lazy var eventManager: EventManagerProtocol = {
        return EventManager(service: service)
    }()
    
    static let shared = AppDependencies()
    
    public func setScene(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        window?.makeKeyAndVisible()
    }
    
    // MARK: - Tab Bar Controller
    
    public func start() {
        
        let isLoggedIn:Bool = true
        
        if isLoggedIn {
            setRootViewController(makeMainTabBarController())
        } else {
//            setRootViewController()
        }

    }
    
    private func makeMainTabBarController() -> UIViewController {
        
        let eventsVC = makeEventListViewController()
        let savedEventsVC = makeSavedViewController()
        let tabController = MainTabBarController(
            viewControllers: [eventsVC, savedEventsVC])
//        tabController.tabBar.barTintColor = UIColor(red: 0.33, green: 0.00, blue: 0.92, alpha: 1.00)
        return tabController
    }
    
    public func setRootViewController(_ viewController: UIViewController) {
        window?.rootViewController = viewController
    }
    
    func makeEventListViewController() -> UIViewController {
        let viewModel = EventListViewControllerViewModel(manager: eventManager)
        let router = EventListRouter()
        let viewController = EventListViewController(viewModel: viewModel, router: router)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.title = "All events"
        navigationController.tabBarItem.image = UIImage(named: "AllEvents")
        navigationController.tabBarController?.tabBar.tintColor = .red
        router.navigationController = navigationController
        return navigationController
    }
    
    func makeSavedViewController() -> UIViewController {
        let viewModel = EventListViewControllerViewModel(manager: eventManager)
        let router = EventListRouter()
        let viewController = EventListViewController(viewModel: viewModel, router: router)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.title = "saved events"
        navigationController.tabBarItem.image = UIImage(named: "SavedEvents")
        navigationController.tabBarController?.tabBar.tintColor = .red
        router.navigationController = navigationController
        return navigationController
    }
    
    func makeDetailEventViewController() -> UIViewController {
        let viewController = EventDetailViewController()
        return viewController
    }

}

