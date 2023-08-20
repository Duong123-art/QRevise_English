//
//  BaseRoute.swift
//  QRevise_English
//
//  Created by quang.duong on 20/08/2023.
//

import Foundation

protocol BaseRoute {}

protocol BaseRouter {
    associatedtype Route
    func move(to route: Route)
}

protocol AnyCoordinator {}

class CoordinatorWrapper<T: BaseRoute>: AnyCoordinator {
    var coordinator: Coordinator<T>?
    
    init(coordiator: Coordinator<T>?) {
        self.coordinator = coordiator
    }
}

class Router<T>: BaseRouter {
    typealias Route = T
    private var transform: ((Route) -> Void)? = nil
    
    
    func setTransform(transform: ((Route) -> Void)?) {
        self.transform = transform
    }
    
    func move(to route: Route) {
        if let transform = transform {
            transform(route)
        }
    }
}

