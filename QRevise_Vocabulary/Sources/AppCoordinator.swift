//
//  AppCoordinator.swift
//  QRevise_English
//
//  Created by quang.duong on 15/08/2023.
//

import UIKit

enum AppRoute: BaseRoute {
    case auth, learning
}

class AppCoordinator: Coordinator<AppRoute> {
    private var window: UIWindow?
    private var childCoordinators: [AnyCoordinator]?
    
    init(window: UIWindow) {
        super.init(navigationViewController: BaseNavigationViewController())
        self.window = window
        self.setRouterBehaviour(transform: transform)
    }
    
    func start() {
        let rootCoordinator = LearningCoordinator(parentCoordinator: self,
                                                  navigationViewController: self.navigationViewController)
        
        childCoordinators?.append(CoordinatorWrapper(coordiator: rootCoordinator))
        
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
    }
    
    override func transform(route: AppRoute) {
        switch route {
        case .auth:
            print("Hello")
        case .learning:
            let coordinator = LearningCoordinator(parentCoordinator: self,
                                                      navigationViewController: self.navigationViewController)
            coordinator.start()
        }
    }
    
    
    
}
