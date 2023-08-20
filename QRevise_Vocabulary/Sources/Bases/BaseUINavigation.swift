//
//  BaseUINavigation.swift
//  QRevise_English
//
//  Created by quang.duong on 15/08/2023.
//

import UIKit

class BaseNavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.tintColor = .white
        navigationBar.barTintColor = .blue
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
    }
}
