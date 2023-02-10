//
//  Appdependencies.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 13/1/2023.
//

import Foundation
import UIKit
import CoreData

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
    
    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: "EventEntity")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
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
    
    func makeDetailEventViewController(for event: Event) -> UIViewController {
        let dataManager: DataManagerProtocol = DataManager.shared
        let viewModel = EventDetailViewControllerViewModel(event: event, dataManager: dataManager)
        let viewController = EventDetailViewController(viewModel: viewModel)
        return viewController
    }

}

