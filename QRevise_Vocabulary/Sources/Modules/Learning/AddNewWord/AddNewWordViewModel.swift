//
//  AddNewWordViewModel.swift
//  QRevise_English
//
//  Created by quang.duong on 15/08/2023.
//

import Foundation
import RxSwift

class AddNewWordViewModel: ViewModelType {
    private let router: Router<LearningRoute>?
    
    init(router: Router<LearningRoute>?) {
        self.router = router
    }
    
    func goToReviseScreen() {
        router?.move(to: .reviseOldWord)
    }
}
