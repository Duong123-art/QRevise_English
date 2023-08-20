//
//  LearningCoordinator.swift
//  QRevise_English
//
//  Created by quang.duong on 16/08/2023.
//

import Foundation

enum LearningRoute: BaseRoute {
    case addNewWord
    case reviseOldWord
}

class LearningCoordinator: Coordinator<LearningRoute> {
    private var parentCoordinator: AppCoordinator?
    
    init(parentCoordinator: AppCoordinator,
         navigationViewController: BaseNavigationViewController?) {
        super.init(navigationViewController: navigationViewController)
        self.parentCoordinator = parentCoordinator
        self.start()
    }
    
    func start() {
        let rootViewModel = AddNewWordViewModel(router: getRouter())
        let rootViewController = AddNewWordViewController(viewModel: rootViewModel)
        
        self.setRootViewController(rootViewController: rootViewController)
        self.setRouterBehaviour(transform: transform)
    }
    
    override func transform(route: LearningRoute) {
        switch route {
        case .addNewWord:
            let rootViewModel = AddNewWordViewModel(router: getRouter())
            let rootViewController = AddNewWordViewController(viewModel: rootViewModel)
            self.push(viewController: rootViewController)
            break;
        case .reviseOldWord:
            let viewModel = ReviseWordViewModel(router: getRouter())
            let viewController = ReviseWordViewController(viewModel: viewModel)
            self.push(viewController: viewController)
            break;
        }
    }
}
