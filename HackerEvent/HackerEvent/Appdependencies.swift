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
//    private lazy var service: AppServiceProtocol = {
//        return AppService()
//    }()
    static let shared = AppDependencies()
    
    public func setScene(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        window?.makeKeyAndVisible()
    }
    
    public func setRootViewController(_ viewController: UIViewController) {
        window?.rootViewController = viewController
    }
    
    func makeHomeViewController() -> UIViewController {
        let viewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.title = "Home"
        navigationController.tabBarItem.image = UIImage(systemName: "house")
        return navigationController
    }

}

