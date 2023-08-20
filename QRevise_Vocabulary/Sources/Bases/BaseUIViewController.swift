//
//  BaseUIViewController.swift
//  QRevise_English
//
//  Created by quang.duong on 15/08/2023.
//

import Foundation
import UIKit

protocol ViewModelType {}
protocol ViewControllerType {
    associatedtype T
}

class BaseUIViewController<T: ViewModelType>: UIViewController {
    var viewModel: ViewModelType?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: T) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    
    deinit {
        print("deinit viewController")
    }
}

extension BaseUIViewController: ViewControllerType {
    typealias ViewModelType = T
}
