//
//  BaseCoordinator.swift
//  QRevise_English
//
//  Created by quang.duong on 15/08/2023.
//

import UIKit

protocol BaseCoordinator {
    associatedtype Route
    var navigationViewController: BaseNavigationViewController? {set get}
    func transform(route: Route)
}

class Coordinator<T>: BaseCoordinator {
    typealias Route = T
    internal var navigationViewController: BaseNavigationViewController?
    private var rootViewController: UIViewController?
    private var router: Router<Route>?
    
    init(navigationViewController: BaseNavigationViewController? = nil) {
        self.navigationViewController = navigationViewController
        self.router = Router()
    }
    
    func setRouterBehaviour(transform: ((Route) -> Void)?) {
        self.router?.setTransform(transform: transform)
    }
    
    func getRouter() -> Router<Route>? {
        return router
    }
    
    func getRootViewController() -> UIViewController? {
        return self.rootViewController
    }
    
    func setRootViewController(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        self.navigationViewController?.pushViewController(rootViewController, animated: true)
    }
    
    func transform(route: Route) {}
}

// MARK: - Transform
extension Coordinator {
    func push(viewController: UIViewController) {
        self.rootViewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func dissmiss(animated: Bool) {
        self.rootViewController?.dismiss(animated: animated)
    }
    
    func present(viewController: UIViewController) {
        self.rootViewController?.present(viewController, animated: true)
    }
}
